From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC][PATCH v2] documentation/devicetree: Move DT bindigns from
 gpio to watchdog
Date: Wed, 28 Aug 2013 08:38:56 -0600
Message-ID: <521E0B80.6040302@wwwdotorg.org>
References: <521672A1.6010202@wwwdotorg.org> <1377601837-18989-1-git-send-email-johannes.thumshirn@men.de> <521D1D16.9080106@wwwdotorg.org> <20130828062232.GA10368@jtlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130828062232.GA10368@jtlinux>
Sender: linux-doc-owner@vger.kernel.org
To: Johannes Thumshirn <johannes.thumshirn@men.de>
Cc: Rob Landley <rob@landley.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/28/2013 12:22 AM, Johannes Thumshirn wrote:
> On Tue, Aug 27, 2013 at 03:41:42PM -0600, Stephen Warren wrote:
>> On 08/27/2013 05:10 AM, Johannes Thumshirn wrote:
>>> I accidently put the devicetree bindings for the MEN A21 watchdog driver in
>>> Documentation/devicetree/bindings/gpio instead of
>>> Documentation/devicetree/bindings/watchdog, this patch addresses this error.
>>
>>>  Changes to v1:
>>>  - Use named gpios, as suggested by Stephen Warren
>>
>> The move and the change to the binding should probably be separate
>> patches since they're logically separate things. I didn't intend you to
>> update the rename patch to fix the binding issue I pointed out.
>>
> 
> Oops. Looks like I've misunderstood you there. I'll re-send the rename patch
> then.
> 
>> Is the driver updated for this binding change? Are there DTs in released
>> kernels that won't work now, or is the driver very new; there may be a
>> need for the driver to support the old binding and the binding doc to
>> document the old gpios property, but mark it deprecated.
> 
> The driver is not yet updated, this is why I've sent it as an RFC. Are the
> bindings acceptable this way? If yes I'll update the driver and re-send the
> bindings with the driver as a new patch series.

Well, XXX says:

> GPIO properties should be named "[<name>-]gpios"

whereas in this patch, some of the renamed properties were "-gpio"
rather than "-gpios". Aside from that, the new binding looks reasonable.

However, I see that the existing binding will be released as part of
v3.11. That implies that we should continue to support the old binding
for compatibility. As such, I'm not convinced whether it's worth
changing this binding now.
