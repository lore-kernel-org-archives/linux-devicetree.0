From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 7/8] drm/bridge/synopsys: dsi: add dual-dsi support
Date: Mon, 9 Jul 2018 18:02:51 +0200
Message-ID: <20180709160253eucas1p153ae3c245dc63e68f6d2147600cbaa0d~-vsoUmEsR3259932599eucas1p11@eucas1p1.samsung.com>
References: <20180618102806.15650-1-heiko@sntech.de>
 <20180618102806.15650-8-heiko@sntech.de>
 <20180703170704eucas1p219825811a840a2bbe077a3439c5d1558~96s9V2Ipb1884318843eucas1p2B@eucas1p2.samsung.com>
 <CGME20180709142201epcas1p1a3ead46ee84399e08cd004e7bcb10a2e@epcas1p1.samsung.com>
 <3506508.xeQ9YkZVU1@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <3506508.xeQ9YkZVU1@phil>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, hoegsberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, philippe.cornu-qxv4g6HH51o@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, yannick.fertre-qxv4g6HH51o@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09.07.2018 15:45, Heiko Stuebner wrote:
> Am Dienstag, 3. Juli 2018, 19:07:02 CEST schrieb Andrzej Hajda:
>> On 18.06.2018 12:28, Heiko Stuebner wrote:
>>> From: Nickey Yang <nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>
>>> Allow to also drive a slave dw-mipi-dsi controller in a dual-dsi
>>> setup. This will require additional implementation-specific
>>> code to look up the slave instance and do specific setup.
>>> Also will probably need code in the specific crtcs as dual-dsi
>>> does not equal two separate dsi outputs.
>>>
>>> To activate, the implementation-specific code should set the slave
>>> using dw_mipi_dsi_set_slave() before calling __dw_mipi_dsi_bind().
>>>
>>> v2:
>>> - expect real interface number of lanes
>>> - keep links to both master and slave
>> I did not see the whole driver/pipeline, but it seems the point of this
>> patch is to perform the same work on the slave as on the master in case
>> of dual mode. I think DSI should not be a place for it,
>> DSI masters usually are stupid devices from display stack PoV, they just
>> convert video streams, in dual mode also. In this case the panel and/or
>> crtc adds complications so they should be responsible for handling it.
>> Panel should:
>> - register its both mipi interfaces with proper mode_flags (maybe some
>> dual-mode indication flags should be added if necessary),
>> - register drm_panel for both interfaces (it requires change in
>> drm_panel api), and provide video mode timings.
>> - in case it needs perform transfers perform it to master/slave/both
>> interfaces according to its needs,
>>
>> I am not sure about DRM pipeline, it should model, maybe it could be
>> done this way:
>> CRTC -->ENCODER0(dsi master) --> CONNECTOR0 (panel interface 0)
>>       |---> ENCODER1(dsi slave) --> CONNECTOR1 (panel interface 1)
>>
>> But I am not sure if it is not reserved only for mirroring.
>>
>> For me more tempting solution is to create meta-encoder-connector let's
>> call it dual-encoder (maybe it could be even generic), which is visible
>> to userspace as single pipeline and encapsulates both dsi bridges/panel
>> inputs. So its every callback will be translated usually to sequence of
>> callbacks to 1st and 2nd dsi, or in case of get_modes it should return
>> mode which represent sum of modes in both panels.
>> Maybe it looks more complicated, but it can be more universal - you can
>> use it with different bridges/panels even two single-panels if necessary.
>>
>> Of course I do not see the whole picture, or I can be just wrong, or
>> just freaking purist :). If there are arguments against my vision please
>> provide them.
>> I am also not strongly against your solution, I just want to show
>> alternatives, which could be better/more generic.
> I cannot really claim to know the correct way to go forward, as these
> drm-internals are still very much unknown land for me, but current
> thought points I had on this:
>
> - strawman argument ;-) : this is the same way tegra handles dual-dsi
>   in its ganged mode ... also with regards to panel handling
>   With Thierry helming both panels and the tegra dual-dsi change

Yes, and I remember our disagreement on the subject :)

>
> - while the panel may expose two DSI data interfaces, there is still
>   only one power-sequence and also only one init-command sequence.

As in case of almost all devices exposing two, or more interfaces.

>   So I don't think you can really handle a dual-dsi panels as two fully
>   separate panels, creating instead the need for both panel-instances
>   to work together

The question is if they can work separately? Ie is it possible to use
only one interface, and have picture only on left/top side, even/odd
lines? Or to have connected interfaces to two independent display
controllers (of course via some dsi bridges)? Btw I have not seen
bindings/driver for the panel, what is the panel name?
The answer for above questions would be helpful.
If the only way of work is with both dsi interfaces, exposing one
drm_panel maybe could be OK.

The point is if the panel has two interfaces it should be his
responsibility for handling it, not the poor DSI host, which is just for
converting native video signal (RGB I guess) to DSI. The other
responsible for the mess is CRTC which actually should negotiate with
panel how the data is split between both channels (left/right,
top/bottom, odd/even, ....). DSI-host here serves only as data
transport, in fact it does not need to know if it works in dual mode or
not (from HW point of view) - dual mode is just something which only
CRTC and panel should be really aware.

See what will happen to your solution if in next version of hardware vendor:
1. replace dual-panel with two panels glued together.
2. replace DSI bridges with different ones.
3. replace only one DSI briges - ie two different bridges working in
dual mode.

>
> - Right now we have two data-points on dual-something voodoo
>   (tegra+rockchip)
>   So for me it sounds hard to design something generic that survives
>   the first non-dsi use-case.

As I said I do not insist on the solution, but I want to show you it can
be dead-end. On the other side maybe dual dsi solutions will die
eventually soon, so there is no point in polishing it :)

Regards
Andrzej

>
>   The devicetree binding (see cover-letter) should be pretty stable, as
>   a panel like this will need to be bound to one of the two dsi controllers
>   so nothing hinders code changes later on if the need for a more generic
>   solution comes up.
>
>
> Heiko
>
>
>
>
>
