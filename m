From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: Regulator suspend state dt question
Date: Thu, 6 Dec 2012 15:28:38 +0900
Message-ID: <20121206062836.GH10867@opensource.wolfsonmicro.com>
References: <CAM4voa=X_rBkSXRHd=oEOnXhgyfSAeD8LmYnsTeQtd-SYKWwPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAM4voa=X_rBkSXRHd=oEOnXhgyfSAeD8LmYnsTeQtd-SYKWwPg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, lrg@ti.com, Doug Anderson <dianders@chromium.org>, Olof Johansson <olofj@google.com>, Thomas Abraham <thomas.abraham@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 06, 2012 at 11:55:11AM +0530, Abhilash Kesavan wrote:

> As of now there is no support in the regulator core to specify the suspend state
> (mode, enabled/disabled) using dt. I can add new properties specifying
> the intial_state,
> mode, enable/disable but I am not too sure if it is appropriate to add
> such bindings to
> the device tree as they are not actually describing the hardware.

Well, it does depend on the hardware a bit - some hardware is hard wired
to only have one possible suspend state due to power up requirements.
But for a lot of hardware it's flexible...  

> Is calling regulator_suspend_prepare from a machine specific file an option ?

This is not really relevant, it's an orthogonal thing about when we
trigger the state transition in the regulator.

It's not clear what a good solution is here, sorry.
