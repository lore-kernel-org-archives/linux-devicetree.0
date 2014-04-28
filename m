From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH 1/3] driver core & of: Mark of_nodes of added device as
 populated
Date: Mon, 28 Apr 2014 18:37:40 +0100
Message-ID: <1398706660.20390.5.camel@hornet>
References: <1392137610-27842-1-git-send-email-pawel.moll@arm.com>
 <1392137610-27842-2-git-send-email-pawel.moll@arm.com>
 <CAL_JsqJQy7ob87=wPOLxn3X0fTrt2QhAEJ2nPTAmCMZqNZp+sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJQy7ob87=wPOLxn3X0fTrt2QhAEJ2nPTAmCMZqNZp+sw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Jean Delvare <jdelvare@suse.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, lm-sensors@lm-sensors.org, Lee Jones <lee.jones@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Guenter Roeck <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-02-13 at 13:15 -0600, Rob Herring wrote:
> On Tue, Feb 11, 2014 at 10:53 AM, Pawel Moll <pawel.moll@arm.com> wrote:
> > In "Device Tree powered" systems, platform devices are usually
> > massively populated with of_platform_populate() call, executed
> > at some level of initcalls, either by generic architecture
> > or by platform-specific code.
>
> Go read Grant's and my comments from your last posting.

Right, I can't explain why I missed those. Will do right now.

Pawel
