From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [GIT PULL] exynos-drm-next
Date: Fri, 04 Apr 2014 09:28:30 +0200
Message-ID: <533E5F1E.9050609@samsung.com>
References: <1396546492-9978-1-git-send-email-inki.dae@samsung.com>
 <533E3C39.7030705@gmail.com> <00e301cf4fc7$8b8f6330$a2ae2990$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <00e301cf4fc7$8b8f6330$a2ae2990$%dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 04.04.2014 07:34, Inki Dae wrote:
> Hi Tomasz,
>
>> -----Original Message-----
>> From: Tomasz Figa [mailto:tomasz.figa@gmail.com]
>> Sent: Friday, April 04, 2014 2:00 PM
>> To: inki.dae@samsung.com; airlied@linux.ie; dri-
>> devel@lists.freedesktop.org
>> Subject: Re: [GIT PULL] exynos-drm-next
>>
>> Hi Inki,
>>
>> On 03.04.2014 19:34, inki.dae@samsung.com wrote:
>>> Hi Dave,
>>>      Sorry for late.
>>>      This pull request includes MIPI-DSI driver, two panel drivers,
>>>      super device support, and relevant dt bindings.
>>>
>>> Summaries:
>>> - Add MIPI-DSI Driver, and dt bindigs
>>> - Add S6E8AA0 MIPI-DSI based panel drivers, and dt bindings
>>> - Add LD9040 parallel panel driver
>>>     . this driver is placed in drivers/gpu/drm/panel, and it seems
>>>       to be used for exynos drm as of now,
>>> - Add super device support, and dt bindings
>>>     . this patch resolves the probe order issue to sub drivers
>>>       without specific lists
>>
>> I don't think the DT bindings have been Acked by DT maintainers, which is
>> necessary to merge them.
>>
>> Also I believe more discussion is needed on this, but I didn't have time
>> to comment on this series yet. Please hold off with merging the supernode
>> series yet.
>
> I sent a email about review request to you but I didn't get any answer from
> you.

It's been just three days ago and I just didn't find time yet to review 
them. I would like to be able to review all the patches straight after 
them being posted, but unfortunately that's not the only thing I have to do.

Anyway, a common practice in open source world is to let the patches 
wait on the mailing lists for two weeks for people to find some time to 
review them and only then apply. There might be people that don't work 
full time on this area, but still would be interested to do a review in 
some free time.

Also, neither version of this series have been posted to 
linux-samsung-soc mailing list, which is also a key to have a broader 
review. Note that this ML is listed in MAINTAINERS file for all kernel 
files with "exynos" in name.

ARM/S5P EXYNOS ARM ARCHITECTURES
M:      Kukjin Kim <kgene.kim@samsung.com>
L:      linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
L:      linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
S:      Maintained
F:      arch/arm/mach-s5p*/
F:      arch/arm/mach-exynos*/
N:      exynos


> And I think super node concept was already accepted, and relevant
> codes, component framework, has already been merged to mainline. And Linux
> staging next has already such dt bindings. Please see imx dts files.

Yes, they are, but for other platforms not this particular instance.

Any new DT bindings introduced are needed to have an ACK from one of DT 
maintainers to be merged, unless you can't get any reply from any of 
them for a longer time, usually 3 weeks from posting the series to be 
applied.

Of course standard pinging rules apply, so you should ping DT 
maintainers first before applying such series.

>
> I hope this time this series would be merged to mainline so that we could go
> to next step, integrating drm_panel and drm_bridge framework to one
> integrated drm_bridge. So Can you hurry up to review it a bit? I'll wait for
> your ack.

I don't think there is any need to hurry up with this particular series 
for this release. I'd recommend sending a pull request with remaining 
patches separately, as the supernode is not required to make anything 
work, rather than being just a refactor.

Best regards,
Tomasz
