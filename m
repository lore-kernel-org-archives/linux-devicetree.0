From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: [PATCH v2 0/3] EDAC support for Calxeda Highbank
Date: Wed, 13 Jun 2012 12:36:22 -0300
Message-ID: <4FD8B376.5030006@redhat.com>
References: <1339468334-9927-1-git-send-email-robherring2@gmail.com> <4FD7430B.6010005@redhat.com> <4FD8AA3C.6090100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FD8AA3C.6090100@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,


Em 13-06-2012 11:57, Rob Herring escreveu:
> Mauro,
> 
> On 06/12/2012 08:24 AM, Mauro Carvalho Chehab wrote:
>> Hi Rob,
>>
>> Em 11-06-2012 23:32, Rob Herring escreveu:
>>> From: Rob Herring <rob.herring@calxeda.com>
>>>
>>> This series adds EDAC support for Calxeda Highbank platform L2 and
>>> memory ECC hardware.
>>>
>>> This version is rebased current edac next tree for 3.6. Changes in
>>> this version are the addition of a common edac debugfs directory and
>>> coverting the highbank error injection to use debugfs.
>>
>> Thanks for the patches.
>>
>> It looks OK on my eyes, with regards to the EDAC API usage. While this patch
>> touches at the arm/devicetree stuff, most of the changes belong to EDAC, so
>> I'll apply them with my SOB on my tree.
>>
> 
> I found a build error when EDAC_DEBUG is turned off.
> 
> drivers/edac/highbank_mc_edac.c: In function 'highbank_mc_probe':
> drivers/edac/highbank_mc_edac.c:215:9: error: 'struct mem_ctl_info' has no member named 'debugfs'
> drivers/edac/highbank_mc_edac.c:216:50: error: 'struct mem_ctl_info' has no member named 'debugfs'
> drivers/edac/highbank_mc_edac.c:218:10: error: 'highbank_mc_debug_inject_fops' undeclared (first use in this function)
> 
> 
> Do you prefer I respin the patch or do you want a follow on patch?

Both approaches work for me. As such patch fixes a compilation bug, fixing the existing
patch is preferred.

> This is what the fix looks like:
> 
> diff --git a/drivers/edac/highbank_mc_edac.c b/drivers/edac/highbank_mc_edac.c
> index d00dc0b..3185961 100644
> --- a/drivers/edac/highbank_mc_edac.c
> +++ b/drivers/edac/highbank_mc_edac.c
> @@ -124,6 +124,22 @@ static const struct file_operations highbank_mc_debug_inject_fops = {
>          .write = highbank_mc_err_inject_write,
>          .llseek = generic_file_llseek,
>   };
> +
> +static int __devinit highbank_mc_create_debugfs_nodes(struct mem_ctl_info *mci)
> +{
> +       if (!mci->debugfs)
> +               return -ENODEV;
> +
> +       debugfs_create_file("inject_ctrl", S_IWUSR, mci->debugfs, mci,
> +                           &highbank_mc_debug_inject_fops);
> +
> +       return 0;
> +}
> +#else
> +static int __devinit highbank_mc_create_debugfs_nodes(struct mem_ctl_info *mci)
> +{
> +       return -ENODEV;
> +}
>   #endif
>   
>   static int __devinit highbank_mc_probe(struct platform_device *pdev)
> @@ -212,10 +228,7 @@ static int __devinit highbank_mc_probe(struct platform_device *pdev)
>          if (res < 0)
>                  goto err;
>   
> -       if (mci->debugfs)
> -               debugfs_create_file("inject_ctrl", S_IWUSR, mci->debugfs,
> -                                   mci,
> -                                   &highbank_mc_debug_inject_fops);
> +       highbank_mc_create_debugfs_nodes(mci);

I would just declare the function as void, as you're not using the returned argument.

>   
>          devres_close_group(&pdev->dev, NULL);
>          return 0;
> 
> 
> Rob
> 
>> Regards,
>> Mauro.
>>>
>>> Rob
>>>
>>> Rob Herring (3):
>>>     edac: create top-level debugfs directory
>>>     edac: add support for Calxeda highbank memory controller
>>>     edac: add support for Calxeda highbank L2 cache ecc
>>>
>>>    .../devicetree/bindings/arm/calxeda/l2ecc.txt      |   17 ++
>>>    .../devicetree/bindings/arm/calxeda/mem-ctrlr.txt  |   17 ++
>>>    arch/arm/boot/dts/highbank.dts                     |   12 +
>>>    drivers/edac/Kconfig                               |   16 +-
>>>    drivers/edac/Makefile                              |    4 +
>>>    drivers/edac/edac_mc_sysfs.c                       |   23 +-
>>>    drivers/edac/edac_module.c                         |    3 +
>>>    drivers/edac/edac_module.h                         |   14 ++
>>>    drivers/edac/highbank_l2_edac.c                    |  149 ++++++++++++
>>>    drivers/edac/highbank_mc_edac.c                    |  256 ++++++++++++++++++++
>>>    10 files changed, 509 insertions(+), 2 deletions(-)
>>>    create mode 100644 Documentation/devicetree/bindings/arm/calxeda/l2ecc.txt
>>>    create mode 100644 Documentation/devicetree/bindings/arm/calxeda/mem-ctrlr.txt
>>>    create mode 100644 drivers/edac/highbank_l2_edac.c
>>>    create mode 100644 drivers/edac/highbank_mc_edac.c
>>>
>>
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-edac" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
