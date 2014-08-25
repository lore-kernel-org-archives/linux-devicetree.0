From: Jon Loeliger <jdl@jdl.com>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver
 initialization order based on the DT)
Date: Mon, 25 Aug 2014 08:08:59 -0500
Message-ID: <E1XLu15-0002DP-6o@jdl.com>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>
 <20140514141914.446F7C4153D@trevor.secretlab.ca>
 <20140821140211.GD19293@ulmo.nvidia.com> <53F64624.5000403@ahsoftware.de>
 <20140822131919.GX21734@leverpostej> <20140825093931.GB2399@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20140825093931.GB2399@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Alexander Holler <holler@ahsoftware.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> 

> Anyway, instead of going back and forth between "deferred probe is good"
> and "deferred probe is bad", how about we do something useful now and
> concentrate on how to make use of the information we have in DT with the
> goal to reduce the number of cases where deferred probing is required?

Good idea.

The proposal on the table is to allow the probe code
to make a topological sort of the devices based on
dependency information either implied, explicitly stated
or both.  That is likely a fundamentally correct approach.

I believe some of the issues that need to be resolved are:

    1) What constitutes a dependency?
    2) How is that dependency expressed?
    3) How do we add missing dependencies?
    4) Backward compatability problems.

There are other questions, of course.  Is it a topsort
per bus?  Are there required "early devices"?  Should
the inter-node dependencies be expressed at each node,
or in a separate hierarchy within the DTS?  Others.

HTH,
jdl
