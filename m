From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: sun6i: dt: Add new Mele I7 device
Date: Tue, 10 Mar 2015 11:40:46 +0000
Message-ID: <1425987646.21353.96.camel@hellion.org.uk>
References: <1425131285-8640-1-git-send-email-codekipper@gmail.com>
	 <20150303071635.GC4713@lukather> <54F568F8.1040104@redhat.com>
	 <20150303082209.GE4713@lukather> <54F5B51F.6030609@redhat.com>
	 <20150303135847.GH4911@lukather> <54FED277.4040000@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBC4Y5F6PT4PBBQFQ7OTQKGQEPVSOI6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <54FED277.4040000-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-03-10 at 12:16 +0100, Hans de Goede wrote:

> I'm not sure if stdout-path supports aliases

I thought it did but ePAPR section 3.5 says "A string that specifies the
full path to the node" which suggests not, and AFAICT the code doesn't
try to handle alias.

Ian.
