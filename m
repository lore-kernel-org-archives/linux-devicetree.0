From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 5/8] dt-bindings: input: touchscreen: Add max11801-ts
 binding
Date: Mon, 20 Mar 2017 15:43:05 +0800
Message-ID: <20170320074303.GF3443@dragon>
References: <1489647939-4966-1-git-send-email-jagan@openedev.com>
 <20170320023622.GA3443@dragon>
 <CAMty3ZC=mS6L8ajEnZDPJsvMvOH0NF5MBHdc+MYofBXBfe9JXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZC=mS6L8ajEnZDPJsvMvOH0NF5MBHdc+MYofBXBfe9JXg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, Jagan Teki <jagan@openedev.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 20, 2017 at 11:55:27AM +0530, Jagan Teki wrote:
> >> @@ -0,0 +1,18 @@
> >> +* MAXI MAX11801 Resistive touch screen controller with i2c interface
> >> +
> >> +Required properties:
> >> +- compatible: must be "max11801"
> >
> > Shouldn't it have a vendor prefix?
> 
> Drivers i2c_device_id.name doesn't have vendor prefix, should I fix
> that one as well?

No.  The vendor prefix is only needed for device tree compatible.

Shawn
