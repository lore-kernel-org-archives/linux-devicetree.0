From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH] of: Add simple panel device tree binding
Date: Mon, 6 Jan 2014 17:23:34 +0900
Message-ID: <52CA6806.4070300@nvidia.com>
References: <1385145714-3022-1-git-send-email-treding@nvidia.com>
	<52A873DA.9070608@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <52A873DA.9070608@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

On 12/11/2013 11:16 PM, Tomi Valkeinen wrote:
> * PGP Signed by an unknown key
>
> On 2013-11-22 20:41, Thierry Reding wrote:
>
>> +Example:
>> +
>> +	panel: panel {
>> +		compatible = "cptt,claa101wb01";
>> +		ddc-i2c-bus = <&panelddc>;
>> +
>> +		power-supply = <&vdd_pnl_reg>;
>> +		enable-gpios = <&gpio 90 0>;
>> +
>> +		backlight = <&backlight>;
>> +	};
>
> I'm somewhat torn with this, as I agree with Thierry that it's correct
> to have a panel database in the driver, but, on the other hand, it does
> seem impractical.
>
> In my experience, there are lots of panels out there, and each board I
> have has a different one. So, while just a gut feeling, we could end up
> with lots of panel, each used only on one board.
>
> With a quick thought, things would work fine if we just added the
> videomode data to the DT data, instead of a driver database, as Laurent
> suggested.
>
> However... I don't think the panels are usually as simple as that. With
> the panels I've worked with, the driver has to know things like:
>
> - Does the power supply need to be enabled before the enable gpio, and
> if so, how long before? And the same for power off.
>
> - Does the video stream need to be enabled before the enable gpio, and
> if so, how long before? And the same for power off.
>
> - Is the gpio enable, power down, or reset? If reset, what are the timings.
>
> Where will those be defined? This goes back to the power sequence stuff
> again... (Was the power sequences series forgotten?)

Sorry for the very late reply - power sequences are forgotten for now, 
but I don't mind reviving them if a clear use-case emerges. The main 
point of power seqs (at least in my mind) was to be able to define them 
in the DT to avoid things like the panel DB you mention. This idea has 
been dismissed for good reasons, and anyway in the case of the panel it 
is clear that this is not what we want to do.

Now if we make a power sequences framework without DT support, we will 
end up with something that would still require a panel database, and can 
anyway be expressed by functions. The gain would be automated 
error-handling, and reduced footprint for power sequences. Not sure 
that's enough to justify resurrecting the power seqs.

Alex.
