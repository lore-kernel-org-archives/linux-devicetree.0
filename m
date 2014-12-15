From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: Linus' tree (master) not working for Allwinner
 sun4i, sun5i, sun7i SoC-s + fix
Date: Mon, 15 Dec 2014 18:06:28 +0100
Message-ID: <548F1514.8090404@redhat.com>
References: <548F0C8C.3030006@gmail.com> <20141215165655.GL4337@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBHFKXSSAKGQEBE3PCUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141215165655.GL4337@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <j.w.r.degoede-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 15-12-14 17:56, Maxime Ripard wrote:
> Hi,
>
> On Mon, Dec 15, 2014 at 05:30:04PM +0100, Hans de Goede wrote:
>> Hi Maxime,
>>
>> Somehow this commit of your sunxi/clocks-for-3.19 branch has made it
>> into Linus' tree:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?h=sunxi/clocks-for-3.19&id=93746e70be83a3f113134a16065957b324af50f7
>>
>> But this one has not:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?h=sunxi/clocks-for-3.19&id=acbcc0f03b15585387f9ca69c2a976b02cb69023
>>
>> Rather badly breaking Allwinner sun4i, sun5i, sun7i SoC-s.
>
> I don't know what you are looking at, but I don't see any of these
> commits in Linus' current master, either in the git repo itself, or
> using the kernel.org git interface.
>
> They're both part of Mike Turquette's clk-next though, so they should
> both land just fine whenever that will be merged.

Ah you're right, I had all patches from your sunxi/clocks-for-3.19 in my
local tree, and when rebasing on Linus' latest somehow the second one
got dropped on the rebase ?

I did not do any manual work on the rebase it went straight ahead, so
I don't understand how the patch got dropped. Anyways as you said
neither one is in Linus' tree atm, so this is not a problem, sorry
for the noise.

Regards,

Hans
