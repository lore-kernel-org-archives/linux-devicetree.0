From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: imx: Pass 'chosen' and 'memory' nodes
Date: Tue, 24 Jan 2017 19:17:10 -0800
Message-ID: <588818B6.2070908@gmail.com>
References: <1485190450-29153-1-git-send-email-festevam@gmail.com>
 <20170124132733.GY5662@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170124132733.GY5662@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding devicetree list.

On 01/24/17 05:27, Shawn Guo wrote:
> On Mon, Jan 23, 2017 at 02:54:10PM -0200, Fabio Estevam wrote:
>> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>>
>> Commit 7f107887d199 ("ARM: dts: imx: Remove skeleton.dtsi") causes boot
>> issues when the bootloader does not create a 'chosen' node if such node
>> is not present in the dtb.
>>
>> The reason for the boot failure is well explained by Javier Martinez
>> Canillas: "the decompressor relies on a pre-existing chosen node to be
>> available to insert the command line and merge other ATAGS info."
>>
>> , so pass an empty 'chosen' node to fix the boot problem.
>>
>> This issue has been seen in the kernelci reports with Barebox as
>> bootloader.
>>
>> Also pass the 'memory' node in order to fix boot issues on the SolidRun
>> iMX6 platforms.
>>
>> Fixes: 7f107887d199 ("ARM: dts: imx: Remove skeleton.dtsi")
>> Reported-by: kernelci.org bot <bot-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org>
>> Reported-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
>> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
> Applied, thanks.
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
