From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v14 2/4] CMDQ: Mediatek CMDQ driver
Date: Tue, 11 Oct 2016 09:49:51 +0530
Message-ID: <CAJe_ZhcSCiwnuRS2zm605enO_ZLaOY+fEXhNfP2f6AYT3NUxmg@mail.gmail.com>
References: <1473039885-24009-1-git-send-email-hs.liao@mediatek.com>
 <1473039885-24009-3-git-send-email-hs.liao@mediatek.com>
 <1475204778.13398.28.camel@mtksdaap41>
 <1475225778.25044.35.camel@mtksdaap41> <1475226691.13398.35.camel@mtksdaap41>
 <1475228829.3658.1.camel@mtksdaap41> <1475636064.21937.25.camel@mtksdaap41>
 <CAJe_ZhcXw1-MOEiiix5VTtKEVr9Z23s_OyikboDYCd0RQwS5pg@mail.gmail.com>
 <1475670705.335.27.camel@mtksdaap41>
 <CAJe_ZheeEe0xEj733pxr4q=-YzxKHgRM4MMPDJNHa9uRC9Q2zA@mail.gmail.com>
 <1475758897.4102.31.camel@mtksdaap41>
 <CAJe_ZheptRQSmQp2gagqUyXqkOpi1qaTo8QPDTFpQ-+62B6kUw@mail.gmail.com>
 <1476153632.477.2.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1476153632.477.2.camel@mtksdaap41>
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
Cc: Monica Wang <monica.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jiaguang Zhang <jiaguang.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dennis-YC Hsieh <dennis-yc.hsieh@medi>
List-Id: devicetree@vger.kernel.org

On 11 October 2016 at 08:10, Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> On Thu, 2016-10-06 at 18:40 +0530, Jassi Brar wrote:
>> On 6 October 2016 at 18:31, Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>>
>> > Back to our original statement, we need to flush all tasks to queue
>> > in GCE HW; i.e. we need to use mbox_client_txdone after
>> > mbox_send_message, or send tx_done once mailbox controller receive
>> > message (task). However, we still need a way to notice done tasks to
>> > clients. Currently, we don't have a good way to call callback in mailbox
>> > framework. Therefore, CMDQ driver has its owner callback functions.
>> >
>> mbox_client_txdone() is called by the client driver when only it knows
>> the messages has been transmitted (i.e your submitted tasks are done).
>> Obviously the client driver should do any callbacks to its users
>> upstream.
>
> Hi Jassi,
>
> In current CMDQ driver, mbox_client_txdone() is called to prevent the
> blocking of chan->active_req. It is not the real point of CMDQ task
> done, so the client driver cannot do any callbacks to its user upstream.
>
> (1) If we don't use mbox_client_txdone(), could you tell us an
>     alternative way to prevent the blocking of chan->active_req?
>     And then we can use tx_done when CMDQ task is relly done.
>
mbox_client_txdone() should be used only when the mailbox controller
driver can't figure when the TX is done. Client driver (by like some
reply packet) realises the TX is done (for the reply to have arrived).

 If your hardware does flag/irq when tx is done, you should prefer
that over mbox_client_txdone().


> (2) If we use mbox_client_txdone() to prevent the blocking of
>     chan->active_req, could CMDQ driver just uses self-defined callback
>     function to notice client driver CMDQ task done?
>
Anything above the mailbox api, is none of its business. Your platform
specific 'server' driver can implement its own callbacks to notify its
users.
