From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC, v2] documentation/devicetree: Move DT bindigns from gpio
 to watchdog
Date: Tue, 1 Oct 2013 09:18:35 -0700
Message-ID: <20131001161835.GA14449@roeck-us.net>
References: <1377601837-18989-1-git-send-email-johannes.thumshirn@men.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1377601837-18989-1-git-send-email-johannes.thumshirn@men.de>
Sender: linux-doc-owner@vger.kernel.org
To: johannes.thumshirn@men.de
Cc: Rob Landley <rob@landley.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Wim Van Sebroeck <wim@iguana.be>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2013 at 07:10:37PM -0000, johannes.thumshirn@men.de wrote:
> I accidently put the devicetree bindings for the MEN A21 watchdog driver in
> Documentation/devicetree/bindings/gpio instead of
> Documentation/devicetree/bindings/watchdog, this patch addresses this error.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@men.de>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ian.campbell@citrix.com>
> Cc: Rob Landley <rob@landley.net>
> Cc: Wim Van Sebroeck <wim@iguana.be>
> Cc: Guenter Roeck <linux@roeck-us.net>
> 
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
