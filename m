From: Ian Campbell <ijc@hellion.org.uk>
Subject: Re: [PATCH 4/4] ARM: Kirkwood: Add support for many Synology NAS
 devices
Date: Thu, 06 Feb 2014 16:39:25 +0000
Message-ID: <1391704765.2162.7.camel@kazak.uk.xensource.com>
References: <1391634309-3123-1-git-send-email-andrew@lunn.ch>
 <1391634309-3123-5-git-send-email-andrew@lunn.ch>
 <20140206153939.GD8533@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140206153939.GD8533@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Ben Peddell <klightspeed@killerwolves.net>, pawel.moll@arm.com, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-02-06 at 10:39 -0500, Jason Cooper wrote:
> 
> > +                     pmx_fan_33: pmx-fan-33 {
> > +                             marvell,pins = "mpp33";
> > +                             marvell,function = "gpo";
> > +                     }; 

Typo I think.

Ian.
