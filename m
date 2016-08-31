From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v13 0/4] Mediatek MT8173 CMDQ support
Date: Wed, 31 Aug 2016 14:15:29 +0530
Message-ID: <CABb+yY3uJMxcPgV4agGOd447ETe5UF-EqKWadvgfzy_QzzeGCQ@mail.gmail.com>
References: <1472009252-1074-1-git-send-email-hs.liao@mediatek.com>
 <20b10079-3ae2-9da9-1149-0bceabac9837@gmail.com>
 <1472132247.26044.23.camel@mtksdaap41>
 <CABb+yY2-cug=iwjTJEx_NQ9gj+8SZ1uHoD5hVGQDkQ7t5P=vSA@mail.gmail.com>
 <1472631185.21158.44.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1472631185.21158.44.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Monica Wang <monica.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jiaguang Zhang <jiaguang.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dennis-YC Hsieh <dennis-yc.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Philipp
List-Id: devicetree@vger.kernel.org

On Wed, Aug 31, 2016 at 1:43 PM, Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

>> >> The driver uses the mailbox framework, so it should live in the
>> >> drivers/mailbox folder.
>> >
>> > As you know, the maximum number of gce threads is 16.
>> > However, we plan to support more clients in the future,
>> > and they may need to use more than 16 gce threads.
>> >
>> > For this issue, our plan is to let multiple clients share the same gce
>> > thread; i.e. we will acquire gce thread for client dynamically by
>> > internal policy in cmdq driver.
>> > Unfortunately. mailbox channel has exclusive feature.
>> > Quote from comment of mbox_request_channel().
>> > "The channel is exclusively allocated and can't be used by another
>> > client before the owner calls mbox_free_channel."
>> > Therefore, we plan to remove mailbox framework from cmdq driver in the
>> > future.
>> >
>> Platforms that need shared access to a channel, implement a 'server'
>> driver that serialise (which is needed still) the access to common
>> channel. If you think you don't need mutual exclusion and don't care
>> about replies, simply share the mailbox handle among different
>> clients.
>
> Thank you for your kindly reply.
> We would like to discuss further with you on this topic.
>
> Our requirement is
> (1) cmdq task cannot be split, and
> (2) cmdq thread can have multiple cmdq tasks from different clients.
>
> According to your comment "implement a 'server' driver that serialise
> the access to common channel", do you mean we should implement cmdq
> client (mailbox client) as a server and other clients call the functions
> of cmdq client?
>
> clients --> cmdq client (mailbox client) --> cmdq (mailbox controller)
>
> If so, could you please tell us the benefit of using mailbox framework?
>
You don't have to reinvent 80% of the wheel and reuse the mailbox.c
core that supports many features and is tested on many platforms. Your
implementation is going to be quite similar, only you clump all the
code in one file and you use different terminology.

You said "we will acquire gce thread for client dynamically by
internal policy in cmdq driver"
On mailbox api, this maps to simply sharing the channel/thread handle,
protected by a lock, among clients on some basis (like FCFS or
whatever you internal policy is). So your server driver could be very
thin. And all your clients could follow the mailbox api (which is good
from the point of reusability/portability).

> Our original plan is to let cmdq driver manage cmdq thread internally.
> Cmdq driver can choose a suitable cmdq thread to execute a flushed cmdq
> task dynamically, and client doesn't need to know the existence of cmdq
> thread.
>
>
> Could you also please tell us the purpose of putting all mailbox
> driver into mailbox folder?
> We know that some other drivers also follow this rule, and just want
> to know more details.
>
Any driver that implements the Mailbox API should live in
drivers/mailbox/.  And why you should implement mailbox api, is
explained above.
