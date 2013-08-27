From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC][PATCH v2] documentation/devicetree: Move DT bindigns from
 gpio to watchdog
Date: Tue, 27 Aug 2013 15:41:42 -0600
Message-ID: <521D1D16.9080106@wwwdotorg.org>
References: <521672A1.6010202@wwwdotorg.org> <1377601837-18989-1-git-send-email-johannes.thumshirn@men.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1377601837-18989-1-git-send-email-johannes.thumshirn@men.de>
Sender: linux-doc-owner@vger.kernel.org
To: Johannes Thumshirn <johannes.thumshirn@men.de>
Cc: Rob Landley <rob@landley.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/27/2013 05:10 AM, Johannes Thumshirn wrote:
> I accidently put the devicetree bindings for the MEN A21 watchdog driver in
> Documentation/devicetree/bindings/gpio instead of
> Documentation/devicetree/bindings/watchdog, this patch addresses this error.

>  Changes to v1:
>  - Use named gpios, as suggested by Stephen Warren

The move and the change to the binding should probably be separate
patches since they're logically separate things. I didn't intend you to
update the rename patch to fix the binding issue I pointed out.

Is the driver updated for this binding change? Are there DTs in released
kernels that won't work now, or is the driver very new; there may be a
need for the driver to support the old binding and the binding doc to
document the old gpios property, but mark it deprecated.
