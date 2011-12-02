From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 02/14] fdt: Add functions to access phandles,
 arrays and bools
Date: Thu, 1 Dec 2011 20:58:57 -0800
Message-ID: <CAPnjgZ3VN4FPRk1wTJsrzOHvNHNvDwUBHDLJNtVRSHNps=Mjvg@mail.gmail.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
	<1322106896-23054-3-git-send-email-sjg@chromium.org>
	<4ED3D5DC.10502@nvidia.com> <4ED846F4.5080704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4ED846F4.5080704@gmail.com>
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

On Thu, Dec 1, 2011 at 7:33 PM, Jerry Van Baren <gvb.uboot@gmail.com> wrote:
> On 11/28/2011 01:41 PM, Stephen Warren wrote:
>>
>> On 11/23/2011 08:54 PM, Simon Glass wrote:
>>>
>>> Add a function to lookup a property which is a phandle in a node, and
>>> another to read a fixed-length integer array from an fdt property.
>>> Also add a function to read boolean properties.
>>>
>>> Signed-off-by: Simon Glass<sjg@chromium.org>
>>
>> Looking at the U-Boot custodians web page, you need to send the core DT
>> changes (well, probably anything DT related) to Jerry Van Baren.
>
> Yeah, I saw the patch go by. =A0I did not recognize the file it patched a=
nd
> looked at the history:
>
> commit b5220bc6ed6e6a197adf4926958dca1df4b420b0
> Author: Simon Glass <sjg@chromium.org>
> Date: =A0 Mon Oct 24 19:15:32 2011 +0000
>
> =A0 =A0fdt: add decode helper library
>
> =A0 =A0This library provides useful functions to drivers which want to use
> =A0 =A0the fdt to control their operation. Functions are provided to:
> =A0 =A0:
> =A0 =A0:
>
> and the copyright is "Copyright (c) 2011 The Chromium OS Authors."
>
> FDT helper functions have been accumulating in common/fdt_support.c rather
> than a separate file. =A0Simon, what is the history of lib/fdtdec.c? =A0I=
s it a
> shared file from the linux kernel? =A0If it is u-boot specific, it would
> probably be better to add the functions to fdt_support.c.

There are sort-of two FDT strands within U-Boot. The main one is
support for putting together an FDT to pass to the kernel (cmd_fdt,
fdt_support), and the other is for U-Boot's own use (run-time
configuration of U-Boot, fdtdec). They both use libfdt.

I regard fdt_support as part of the former, and fdtdec (decode-only
helper functions) as part of the latter. At present when you turn on
CONFIG_OF_LIBFDT you get everything, but we could provide finer
granularity for platforms which only want to decode an FDT for
run-time config and don't want to mess with it. Since fdt_decode is
about 6KB of code that might be useful.

>
> In the same vein, I also have not looked at the functions provided by
> fdtdec.c to see if there is any overlap with existing fdt_support.c
> functions (a quick look says not).

No, they are pretty low-level. An argument could be made for them to
go into libfdt once they are stable, but we are certainly not there
yet. I have quite a few patches which add more functions for
extracting data.

Regards,
Simon

>
> Best regards,
> gvb
>
> [snip]
>
