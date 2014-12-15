From: Hans de Goede <j.w.r.degoede-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Linus' tree (master) not working for Allwinner sun4i,
 sun5i, sun7i SoC-s + fix
Date: Mon, 15 Dec 2014 17:30:04 +0100
Message-ID: <548F0C8C.3030006@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBDUZXSSAKGQEURSIGFQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Somehow this commit of your sunxi/clocks-for-3.19 branch has made it into Linus' tree:

https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?h=sunxi/clocks-for-3.19&id=93746e70be83a3f113134a16065957b324af50f7

But this one has not:

https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?h=sunxi/clocks-for-3.19&id=acbcc0f03b15585387f9ca69c2a976b02cb69023

Rather badly breaking Allwinner sun4i, sun5i, sun7i SoC-s.

Regards,

Hans
