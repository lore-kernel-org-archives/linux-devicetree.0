From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 2/2] sunxi: Initial Inet 86VS support.
Date: Wed, 28 Jan 2015 11:11:06 +0100
Message-ID: <54C8B5BA.5010009@redhat.com>
References: <cover.1422316795.git.hramrach@gmail.com> <b6bc51df9b432465b7615d60e2f9ffcd6d9900f8.1422316795.git.hramrach@gmail.com> <54C8B3D2.8060601@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBQPLUKTAKGQEKMZNDZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <54C8B3D2.8060601-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 28-01-15 11:02, Hans de Goede wrote:
> Hi,
>
> On 04-01-15 21:06, Michal Suchanek wrote:
>> Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Thanks, I've merged this with a number of changes:
>
> - Cleaned it up a bit
> - Ported it to our new simplified dram config code in u-boot-sunxi/next
> - Added OTG (host mode) support, so that you can hookup a keyboard and
>    interact with u-boot (kernel otg host support is coming soonish too)
> - Fixed the dtb name from sun5i-inet-86vs.dtb to sun5i-a13-inet-86vs.dtb
>    to match the upstream kernel dts / dtb naming scheme.

Talking about upstream dts files, it would be great if you could officially
submit one for the Inet 86VS upstream:

1) Drop any nand bits you may have in there as the nand code is not upstream yet
2) We've recently adapted a new style for upstream dts files, please reformat
    the dts you've accordingly, see e.g.:
    https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?h=sunxi/dt-for-3.20&id=19a08b6b3f782f577b4b0fef9b6e60beba66c2f3
3) Write a proper commit message with a short description of the board, and
    be sure to add a Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
4) Be sure to send the patch directly to Maxime Ripard, with devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
    in the Cc, you may Cc other people / lists too, but you must send it to
    those 2 addresses.

Regards,

Hans
