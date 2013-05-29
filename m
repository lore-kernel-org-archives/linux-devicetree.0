From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] fdt: Enhance dts/Makefile to be all things to all men
Date: Wed, 29 May 2013 08:59:14 -0700
Message-ID: <CAPnjgZ04BKhQtpJct9tvN8rW5Wae+6fxxOOQDnEkmgrr-mAfwg@mail.gmail.com>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <51A51A50.4050308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51A51A50.4050308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: u-boot-review <u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Tue, May 28, 2013 at 1:57 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/28/2013 01:36 PM, Simon Glass wrote:
>> There are a few partially conflicting requirements in compiling the device
>> tree, since U-Boot relies on whatever is installed on the build machine.
>>
>> Some versions of dtc support -i, and this is often better than using #include
>> since you get correct line number information in errors.
>
> What issue is there with line numbers when using dtc? Recent dtc
> supports #line directives from the pre-processing results, and hence
> reports errors in terms of the source files, just like raw dtc without cpp.

That's the issue. What does dtc v1.3 do?

>
>> Unfortunately this
>> version must be installed manually in current Linux distributions.
>
> Well, then that gets into the problem of some .dts files choosing to use
> /include/ and rely on -i, but others using #include and not. I don't
> really think it's a good idea to propagate both versions. Picking one
> and using it would be far better.
>
> I really do think we should simply require a reasonably recent dtc and
> be done with it.

I would be happy with that, but it can be an extra barrier to getting
U-Boot building. So do we need using #include at all if we are using
-i ?

>
>> Some device tree files use the word 'linux' which gets replaced with '1' by
>> many version of gcc, including version 4.7. So undefine this.
>
> Linux chose to use -undef rather than undefining specific/individual
> defines. It'd be best to be consistent to that .dts files are more
> likely to be portable between the two.

Seems a bit extreme, but OK. Are you worried that gcc defines other
things without the double underscore?

>
>> diff --git a/dts/Makefile b/dts/Makefile
>
>> +# Provide a list of include directories for dtc
>> +DTS_INCS-y := -i $(SRCTREE)/arch/$(ARCH)/dts
>> +
>> +DTS_INCS-y += -i $(SRCTREE)/board/$(VENDOR)/dts
>
> That has arch/ first then board/ ... (continued a few comments below)
>
>> +DTS_INCS-$(CONFIG_CHROMEOS) += -i $(SRCTREE)/cros/dts
>
> Is that meant to be upstream?
>
>> +# Check if our dtc includes the -i option
>> +DTS_FLAGS := $(shell if ! dtc -i 2>&1 | grep -q "invalid option"; then \
>> +             echo $(DTS_INCS-y); fi)
>> +
>>  # We preprocess the device tree file provide a useful define
>> -DTS_CPPFLAGS := -x assembler-with-cpp \
>> +# Undefine 'linux' since it might be used in device tree files
>> +DTS_CPPFLAGS := -x assembler-with-cpp -Ulinux \
>
> I'll repeat my request to use -undef instead.
>
>>               -DARCH_CPU_DTS=\"$(SRCTREE)/arch/$(ARCH)/dts/$(CONFIG_ARCH_DEVICE_TREE).dtsi\" \
>>               -DBOARD_DTS=\"$(SRCTREE)/board/$(VENDOR)/$(BOARD)/dts/$(DEVICE_TREE).dts\" \
>> -             -I$(SRCTREE)/board/$(VENDOR)/dts -I$(SRCTREE)/arch/$(ARCH)/dts
>> +             -D__ASSEMBLY__ -I$(OBJTREE)/include -I$(SRCTREE)/include \
>> +             -I$(OBJTREE)/include2 \
>
> Do we really want include or include2 (what's that?) at all? The .dts
> files really should be standalone, and not interact with the U-Boot
> headers at all.

I understood that you were wanting to make use of U-Boot defines. If
you want to include include/config.h then I think you need these.

>
>> +             -I$(SRCTREE)/board/$(VENDOR)/dts -I$(SRCTREE)/arch/$(ARCH)/dts \
>
> ... whereas this has board/ first then arch/. It'd be better to be
> consistent.

OK

>
>> +             -include $(OBJTREE)/include/config.h
>> +
>> +DTS_TMP := $(OBJTREE)/include/generated/$(DEVICE_TREE).dts.in
>
> Hmm. This really isn't a generated header file. Can this instead be
> $(OBJTREE)/$(dir $@).$(notdir $@).dts or something like that?

I didn't say header file.

The nice thing about having everything in include/generated is that it
doesn't pollute the source for in-tree builds.

>
>> +DTS_SRC := board/$(VENDOR)/dts/$(DEVICE_TREE).dts
>>
>>  all: $(obj).depend $(LIB)
>>
>> @@ -50,13 +68,19 @@ all:      $(obj).depend $(LIB)
>>  # the filename.
>>  DT_BIN       := $(obj)dt.dtb
>>
>> -$(DT_BIN): $(TOPDIR)/board/$(VENDOR)/dts/$(DEVICE_TREE).dts
>> +DTC_CMD := $(DTC) -R 4 -p 0x1000 -O dtb -o ${DT_BIN} $(DTS_FLAGS) $(DTS_TMP)
>
> It may be better to leave $(DTS_TMP) in the make script below, so it's
> more obvious what file is being compiled; the re-direct to $(DTS_TMP) is
> left in the $(CPP) invocation below, so it'd also be consistent with that.
>
>> +$(DT_BIN): $(TOPDIR)/$(DTS_SRC)
>>       rc=$$( \
>> -             cat $< | $(CPP) -P $(DTS_CPPFLAGS) - | \
>> -             { { $(DTC) -R 4 -p 0x1000 -O dtb -o ${DT_BIN} - 2>&1 ; \
>> +             cat $< | $(CPP) -P $(DTS_CPPFLAGS) - > $(DTS_TMP); \
>> +             { { $(DTC_CMD)  2>&1 ; \
> ...
>
>> +     if [ $$rc != 0 ]; then \
>> +             echo "Source file is $(DTS_SRC)"; \
>> +             echo "Compiler: $(DTC_CMD)"; \
>> +     fi; \
>
> Isn't that what make V=1 is for?

It produces about 800KB of other spiel though. If the build fails it
is already printing stuff out - so I find this useful.

>

Regards,
Simon
