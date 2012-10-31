From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: How about a gpio_get(device *, char *) function?
Date: Wed, 31 Oct 2012 09:25:41 -0600
Message-ID: <509142F5.4010307@wwwdotorg.org>
References: <38620644.IyR5R8rjKP@percival>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <38620644.IyR5R8rjKP@percival>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/31/2012 03:04 AM, Alex Courbot wrote:
> Hi,
> 
> Would anyone be opposed to having a gpio_get() function that works similarly 
> to e.g. regulator_get() and clk_get()?

One major stumbling block is that with device tree, each individual
binding gets to decide on the specific naming of the propert{y,ies} that
define the GPIO(s) for the device, and so there's no way to provide a
generic implementation of that function.

Related, I've always wished that DT nodes looked like:

device {
    reg = <...>;
    compatible = <...>;
    resources {
        pwms = <...>;
        regulators = <...>;
        clocks = <...>;
        gpios = <...>;
        other-devices = <...>; /* for custom API dependencies */
    };
    config {
        /* device-specific properties */
    };
    child-busses {
        0 = { ... };
        1 = { ... };
    };
};

... specifically so that all resource allocation, and perhaps even child
bus enumeration, could be completely standardized in the DT/device core.
This could also feed into deferred probe, which could then be purely
implemented inside the DT/driver core. However, that'd require something
incompatible like "device tree 2.0"
