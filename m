From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v6] clocksource:arm_global_timer: Add ARM global timer
 support.
Date: Tue, 25 Jun 2013 16:00:25 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1306251559160.4013@ionos.tec.linutronix.de>
References: <1372152678-29530-1-git-send-email-srinivas.kandagatla@st.com>
 <alpine.DEB.2.02.1306251459160.4013@ionos.tec.linutronix.de>
 <51C99E33.4070009@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51C99E33.4070009-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 25 Jun 2013, Srinivas KANDAGATLA wrote:
> On 25/06/13 14:17, Thomas Gleixner wrote:
> > On Tue, 25 Jun 2013, Srinivas KANDAGATLA wrote:
> >> +static void gt_compare_set(unsigned long delta, int periodic)
> >> +{
> >> +	u64 counter = gt_counter_read();
> >> +	unsigned long ctrl = readl(gt_base + GT_CONTROL);
> > 
> > Why are you reading the control register back over and over? All you
> > need to preserve is the GT_CONTROL_TIMER_ENABLE bit. So you can spare
> > that read out and just do
> > 
> > 	ctrl = GT_CONTROL_TIMER_ENABLE;
> > 	writel(ctrl, gt_base + GT_CONTROL);
> 
> Logically you are right we could do as you suggested, However its not
> implicit that which bits are going to be cleared. Its more to do with
> readability of the code.
> If you still insist I can change it.

I'm not insisting. I just pointed out, that you can save cycles in a
hotpath. :)

Thanks,

	tglx
