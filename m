From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 02/14] fdt: Add functions to access phandles,
 arrays and bools
Date: Fri, 2 Dec 2011 10:12:33 -0800
Message-ID: <CAPnjgZ18E88tfA+dETjHJHs1+i2MBZsmqRCeoa23LWmMerdZBQ@mail.gmail.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
	<1322106896-23054-3-git-send-email-sjg@chromium.org>
	<4ED3D5DC.10502@nvidia.com> <4ED846F4.5080704@gmail.com>
	<CAPnjgZ3VN4FPRk1wTJsrzOHvNHNvDwUBHDLJNtVRSHNps=Mjvg@mail.gmail.com>
	<4ED90967.4080402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4ED90967.4080402@gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Jerry Van Baren <gvb.uboot@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Jerry,

On Fri, Dec 2, 2011 at 9:22 AM, Jerry Van Baren <gvb.uboot@gmail.com> wrote:
> On 12/01/2011 11:58 PM, Simon Glass wrote:
>>
>> Hi Jerry,
>>
>> On Thu, Dec 1, 2011 at 7:33 PM, Jerry Van Baren<gvb.uboot@gmail.com>
>> =A0wrote:
>
> [snip]
>
>>> FDT helper functions have been accumulating in common/fdt_support.c
>>> rather
>>> than a separate file. =A0Simon, what is the history of lib/fdtdec.c? =
=A0Is it
>>> a
>>> shared file from the linux kernel? =A0If it is u-boot specific, it would
>>> probably be better to add the functions to fdt_support.c.
>>
>> There are sort-of two FDT strands within U-Boot. The main one is
>> support for putting together an FDT to pass to the kernel (cmd_fdt,
>> fdt_support), and the other is for U-Boot's own use (run-time
>> configuration of U-Boot, fdtdec). They both use libfdt.
>>
>> I regard fdt_support as part of the former, and fdtdec (decode-only
>> helper functions) as part of the latter. At present when you turn on
>> CONFIG_OF_LIBFDT you get everything, but we could provide finer
>> granularity for platforms which only want to decode an FDT for
>> run-time config and don't want to mess with it. Since fdt_decode is
>> about 6KB of code that might be useful.
>
> Ahh, I see. =A0I have not been closely tracking the u-boot config (fdtdec)
> improvements, so I did not recognize it as being part of that effort. That
> makes sense.

You are welcome, thanks.

Regards
Simon

>
> Thanks,
> gvb
>
> [snip]
>
