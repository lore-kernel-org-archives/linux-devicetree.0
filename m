From: "Will Deacon" <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: RE: [RFC PATCH] ARM: pmu: add OF match support
Date: Wed, 9 Feb 2011 09:51:27 -0000
Message-ID: <41755.5343745791$1297697208@news.gmane.org>
References: <1297223617-19173-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1297223617-19173-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-gb
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: 'Rob Herring' <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

> Add OF match table to enable OF style driver binding. The dts entry is like
> this:
> 
> pmu {
> 	compatible = "arm,pmu";
> 	interrupts = <100 101>;
> };
> 
> The use of pdev->id as an index breaks with OF device binding. Change to use
> a counter instead. If more than 1 pmu device is ever really supported, a
> better solution to match users with particular pmu is probably needed.

We will want to support multiple PMU devices in the near future but
this is currently blocked on userspace issues. One such device would
be the event counters on the PL310, which could be used to complement
the CPU PMU on the Cortex-A9.

I don't like the idea of a counter as it forces platforms to register
their devices in a specific order. Is it possible to separate different
types of PMU in the device tree and then have pmu.c work out what to do
with them?

Will
