From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 0/8] tilcdc-panel: Backlight and GPIO devicetree support
Date: Fri, 25 Jul 2014 11:44:32 -0300
Message-ID: <20140725144432.GA3594@arch.cereza>
References: <1405088334-11215-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <53D179C0.2050100@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <53D179C0.2050100@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Darren Etheridge <detheridge@ti.com>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On 24 Jul 04:25 PM, Darren Etheridge wrote:
> On 07/11/2014 09:18 AM, Ezequiel Garcia wrote:
> >Hello all,
> >
> >This patchset adds the required changes to support an optional backlight
> >and GPIO for the tilcdc panel driver.
> >
> >There was some code to support a backlight, but it was somewhat broken
> >and undocumented. I've followed the nice implementation in panel-simple
> >and added a similar one here.
> >
> >The enable GPIO is required to turn on and off devices with such capability.
> >Also here, I've followed panel-simple which looks correct.
> >
> >In addition to this there are very minor cosmetic cleanups and a larger
> >error path fix in tilcdc's DRM driver .load error path.
> >
> >This patchset applies on top of drm-next branch which contains the latest
> >tilcdc pushed by Guido.
> >
> >If at all possible, I'd like to get this merged for v3.17. If a pull request
> >is needed, don't hesitate to ask and I'll prepare one.
> >
> >Comments and tests welcome!
> >
> 
> All of the changes seem to make sense and I tested on AM335x-EVM both with
> and without the addition "backlight = " in the dts for the panel node.
> 
> I see no issues in either case, continued to work as before.
> 
> Tested against 3.16-rc6 with this patchset and the earlier patchset from
> Guido applied.
> 
> Also tested on BeagleBone Black even though it doesn't have a panel, just to
> make sure nothing changed there.
> 
> For the series:
> Tested-by: Darren Etheridge <detheridge@ti.com>
> 

Thanks a lot for the test!
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
