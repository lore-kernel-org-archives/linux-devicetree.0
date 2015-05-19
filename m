From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 0/5]  arm64: Juno DT updates and new DT for Juno R1
Date: Tue, 19 May 2015 12:11:51 +0100
Message-ID: <555B1A77.9070403@arm.com>
References: <1431970109-8902-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431970109-8902-1-git-send-email-Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 18/05/15 18:28, Liviu Dudau wrote:
> This series restructures the Juno DT files and introduces the DT
> for the new Juno R1. The board is an update of the Juno R0 with
> support for PCIe, but the current series only brings the board to
> parity with Juno R0. The series that enable the PCIe Generic Host
> Bridge to be used on Juno R1 will be posted separately.
>
> Changes from v1:
>   - Moved memory node inside juno-base.dtsi as this is common between
>     boards and unlikely to change soon.
>   - Added "arm,juno-r1" as compatible string in juno-r1.dts at Jon Medhurst's
>     suggestion.

It would be good to add these juno* compatible somewhere in the binding
document. In past I have seen checkpatch complaining about missing
compatibles on vexpress(which is annoying if you are not adding it
but fixing a bug around existing node).

Otherwise the whole series looks good to me. So feel free to add

Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
