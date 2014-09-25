From: Josh Cartwright <joshc@codeaurora.org>
Subject: Re: [PATCH v3 2/3] watchdog: qcom: document device tree bindings
Date: Thu, 25 Sep 2014 14:01:35 -0500
Message-ID: <20140925190135.GK868@joshc.qualcomm.com>
References: <cover.1411667144.git.joshc@codeaurora.org>
 <f49033de078aff9112fb8fa6fa4331e16998edf2.1411667144.git.joshc@codeaurora.org>
 <20140925184314.GC12340@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140925184314.GC12340@roeck-us.net>
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 25, 2014 at 11:43:14AM -0700, Guenter Roeck wrote:
> On Thu, Sep 25, 2014 at 12:48:52PM -0500, Josh Cartwright wrote:
[..]
> > +- timeout-sec : shall contain the default watchdog timeout in seconds,
> > +                if unset, the default timeout is 30 seconds
> 
> Hi Josh,
> 
> timeout-sec is optional, not mandatory.

Indeed, I made this change in v2, but didn't reflect it in the document.
Good catch. Will fix.

  Josh

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
