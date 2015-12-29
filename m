From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun4i: Use red1 LED for
 heartbeat indication on Marsboard A10
Date: Tue, 29 Dec 2015 20:42:50 +0800
Message-ID: <CAGb2v66UNyYc4gsvPmEdUe+Tt2kAYgx2q0+M5dUH-VcTrB5NCA@mail.gmail.com>
References: <1451123879-7212-1-git-send-email-mamlinav@gmail.com>
 <20151227205151.GK30359@lukather> <56827DA2.2060006@redhat.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBYP7RG2AKGQE5UB2V4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <56827DA2.2060006-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 29, 2015 at 8:33 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> On 27-12-15 21:51, Maxime Ripard wrote:
>>
>> On Sat, Dec 26, 2015 at 12:57:59PM +0300, Aleksei Mamlin wrote:
>>>
>>> Marsboard A10 have four red LEDs, the first one can be used for
>>> heartbeat indication.
>>>
>>> Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>>
>> I'm really not sure about this one.
>>
>> This is something that can easily be changed through sysfs, and it
>> will likely end up being a "war" on what trigger people want to use.
>>
>> Hans, Chen-Yu, What's your view on this?
>
>
> I would prefer to not set any (default) led triggers in the dts
> files for sunxi boards.

+1

ChenYu
