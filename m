Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:45101 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751054Ab3HSV3M (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 19 Aug 2013 17:29:12 -0400
Message-ID: <52128E21.6020303@wwwdotorg.org>
Date: Mon, 19 Aug 2013 15:29:05 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH/RFC v4 3/3] DT: Add documentation for gp2ap020a00f sensor
References: <1376658760-3459-1-git-send-email-j.anaszewski@samsung.com>
In-Reply-To: <1376658760-3459-1-git-send-email-j.anaszewski@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, kyungmin.park@samsung.com, s.nawrocki@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ian.campbell@citrix.com
List-ID: <devicetree@vger.kernel.org>

On 08/16/2013 07:12 AM, Jacek Anaszewski wrote:
> This patch adds device tree binding documentation
> for the gp2ap020a00f proximity/als sensor.

> diff --git a/Documentation/devicetree/bindings/iio/light/gp2ap020a00f.txt b/Documentation/devicetree/bindings/iio/light/gp2ap020a00f.txt
> new file mode 100644
> index 0000000..e4f377d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/gp2ap020a00f.txt
> @@ -0,0 +1,20 @@
> +* Sharp GP2AP020A00F I2C Proximity/ALS sensor
> +
> +Required properties:
> +
> +  - compatible : should be "sharp,gp2ap020a00f"
> +  - reg : the I2C address of the light sensor
> +  - interrupt-parent : phandle to the parent interrupt controller
> +  - interrupts : should be INT interrupt pin
> +  - vled-supply : VLED power supply, as covered
> +		  in Documentation/devicetree/bindings/regulator/regulator.txt

If this is a sensor for proximity and light, why does it need a
regulator for an LED?
