From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: [PATCH v2 0/3] EDAC support for Calxeda Highbank
Date: Tue, 12 Jun 2012 10:24:27 -0300
Message-ID: <4FD7430B.6010005@redhat.com>
References: <1339468334-9927-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1339468334-9927-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Em 11-06-2012 23:32, Rob Herring escreveu:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> This series adds EDAC support for Calxeda Highbank platform L2 and
> memory ECC hardware.
> 
> This version is rebased current edac next tree for 3.6. Changes in
> this version are the addition of a common edac debugfs directory and
> coverting the highbank error injection to use debugfs.

Thanks for the patches.

It looks OK on my eyes, with regards to the EDAC API usage. While this patch
touches at the arm/devicetree stuff, most of the changes belong to EDAC, so
I'll apply them with my SOB on my tree.

Regards,
Mauro.
> 
> Rob
> 
> Rob Herring (3):
>    edac: create top-level debugfs directory
>    edac: add support for Calxeda highbank memory controller
>    edac: add support for Calxeda highbank L2 cache ecc
> 
>   .../devicetree/bindings/arm/calxeda/l2ecc.txt      |   17 ++
>   .../devicetree/bindings/arm/calxeda/mem-ctrlr.txt  |   17 ++
>   arch/arm/boot/dts/highbank.dts                     |   12 +
>   drivers/edac/Kconfig                               |   16 +-
>   drivers/edac/Makefile                              |    4 +
>   drivers/edac/edac_mc_sysfs.c                       |   23 +-
>   drivers/edac/edac_module.c                         |    3 +
>   drivers/edac/edac_module.h                         |   14 ++
>   drivers/edac/highbank_l2_edac.c                    |  149 ++++++++++++
>   drivers/edac/highbank_mc_edac.c                    |  256 ++++++++++++++++++++
>   10 files changed, 509 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/calxeda/l2ecc.txt
>   create mode 100644 Documentation/devicetree/bindings/arm/calxeda/mem-ctrlr.txt
>   create mode 100644 drivers/edac/highbank_l2_edac.c
>   create mode 100644 drivers/edac/highbank_mc_edac.c
> 
