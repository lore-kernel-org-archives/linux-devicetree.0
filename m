From: Tom Warren <TWarren@nvidia.com>
Subject: Re: [PATCH] fdt: Enhance dts/Makefile to be all things to
	all men
Date: Tue, 28 May 2013 12:53:34 -0700
Message-ID: <5FBF8E85CA34454794F0F7ECBA79798F37AE348984@HQMAIL04.nvidia.com>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1369769778-12455-1-git-send-email-sjg@chromium.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Tom Rini <trini@ti.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, "u-boot-review@google.com" <u-boot-review@google.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

Simon,

> -----Original Message-----
> From: Simon Glass [mailto:sjg@chromium.org]
> Sent: Tuesday, May 28, 2013 12:36 PM
> To: U-Boot Mailing List
> Cc: Tom Rini; Stephen Warren; Devicetree Discuss; u-boot-
> review@google.com; Simon Glass; Tom Warren; Jerry Van Baren
> Subject: [PATCH] fdt: Enhance dts/Makefile to be all things to all men
> 
> There are a few partially conflicting requirements in compiling the device
> tree, since U-Boot relies on whatever is installed on the build machine.
> 
> Some versions of dtc support -i, and this is often better than using #include
> since you get correct line number information in errors. Unfortunately this
> version must be installed manually in current Linux distributions.
> 
> Some device tree files use the word 'linux' which gets replaced with '1' by
> many version of gcc, including version 4.7. So undefine this.
> 
> When an device tree file has an error we want to direct the user to the right
> file and line number. So instead of piping the file into dts through stdin, put it
> in a real file so that we get a fairly sensible error message from dts. Then
> print out the original file details to help further.
> 
> This is based on a commit from Tom Warren. It would help if people can test
> it in different environments.
> 
> Signed-off-by: Tom Warren <twarren@nvidia.com>
> Signed-off-by: Simon Glass <sjg@chromium.org>

Works for me for all Tegra builds, so:

Tested-by: Tom Warren <twarren@nvidia.com>

Tom
> ---
>  dts/Makefile | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/dts/Makefile b/dts/Makefile index 03e163e..1f6fabb 100644
> --- a/dts/Makefile
> +++ b/dts/Makefile
> @@ -37,11 +37,29 @@ $(if $(CONFIG_ARCH_DEVICE_TREE),,\  $(error Your
> architecture does not have device tree support enabled. \  Please define
> CONFIG_ARCH_DEVICE_TREE))
> 
> +# Provide a list of include directories for dtc DTS_INCS-y := -i
> +$(SRCTREE)/arch/$(ARCH)/dts
> +
> +DTS_INCS-y += -i $(SRCTREE)/board/$(VENDOR)/dts
> +
> +DTS_INCS-$(CONFIG_CHROMEOS) += -i $(SRCTREE)/cros/dts
> +
> +# Check if our dtc includes the -i option DTS_FLAGS := $(shell if ! dtc
> +-i 2>&1 | grep -q "invalid option"; then \
> +		echo $(DTS_INCS-y); fi)
> +
>  # We preprocess the device tree file provide a useful define -DTS_CPPFLAGS
> := -x assembler-with-cpp \
> +# Undefine 'linux' since it might be used in device tree files
> +DTS_CPPFLAGS := -x assembler-with-cpp -Ulinux \
>  		-
> DARCH_CPU_DTS=\"$(SRCTREE)/arch/$(ARCH)/dts/$(CONFIG_ARCH_DEVIC
> E_TREE).dtsi\" \
>  		-
> DBOARD_DTS=\"$(SRCTREE)/board/$(VENDOR)/$(BOARD)/dts/$(DEVICE_TR
> EE).dts\" \
> -		-I$(SRCTREE)/board/$(VENDOR)/dts -
> I$(SRCTREE)/arch/$(ARCH)/dts
> +		-D__ASSEMBLY__ -I$(OBJTREE)/include -I$(SRCTREE)/include
> \
> +		-I$(OBJTREE)/include2 \
> +		-I$(SRCTREE)/board/$(VENDOR)/dts -
> I$(SRCTREE)/arch/$(ARCH)/dts \
> +		-include $(OBJTREE)/include/config.h
> +
> +DTS_TMP := $(OBJTREE)/include/generated/$(DEVICE_TREE).dts.in
> +DTS_SRC := board/$(VENDOR)/dts/$(DEVICE_TREE).dts
> 
>  all:	$(obj).depend $(LIB)
> 
> @@ -50,13 +68,19 @@ all:	$(obj).depend $(LIB)
>  # the filename.
>  DT_BIN	:= $(obj)dt.dtb
> 
> -$(DT_BIN): $(TOPDIR)/board/$(VENDOR)/dts/$(DEVICE_TREE).dts
> +DTC_CMD := $(DTC) -R 4 -p 0x1000 -O dtb -o ${DT_BIN} $(DTS_FLAGS)
> +$(DTS_TMP)
> +
> +$(DT_BIN): $(TOPDIR)/$(DTS_SRC)
>  	rc=$$( \
> -		cat $< | $(CPP) -P $(DTS_CPPFLAGS) - | \
> -		{ { $(DTC) -R 4 -p 0x1000 -O dtb -o ${DT_BIN} - 2>&1 ; \
> +		cat $< | $(CPP) -P $(DTS_CPPFLAGS) - > $(DTS_TMP); \
> +		{ { $(DTC_CMD)  2>&1 ; \
>  		    echo $$? >&3 ; } | \
>  		  grep -v '^DTC: dts->dtb  on file' ; \
>  	        } 3>&1 1>&2 ) ; \
> +	if [ $$rc != 0 ]; then \
> +		echo "Source file is $(DTS_SRC)"; \
> +		echo "Compiler: $(DTC_CMD)"; \
> +	fi; \
>  	exit $$rc
> 
>  process_lds = \
> --
> 1.8.2.1
--
nvpublic
