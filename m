From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH 2/2] misc: Add initial Digital Timing Engine (DTE) driver
 for cygnus
Date: Wed, 13 May 2015 21:42:40 +0200
Message-ID: <20150513194240.GB11130@localhost.localdomain>
References: <1429744923-2007-1-git-send-email-jonathar@broadcom.com>
 <1429744923-2007-3-git-send-email-jonathar@broadcom.com>
 <6346218.3x3hbSlxMs@wuerfel>
 <5543CD73.2030902@broadcom.com>
 <20150513152130.GB2065@localhost.localdomain>
 <5553A82E.7070304@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5553A82E.7070304@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Richardson <jonathar@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Darren Edamura <dedamura@broadcom.com>, Mark Rutland <mark.rutland@arm.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, May 13, 2015 at 12:38:22PM -0700, Jonathan Richardson wrote:
> The input events may occur at a rate greater than we want to generate
> timestamps at. Maybe we need a better term than divider. The h/w sees x
> input signals over x period of time and then samples the input signal at
> a divided down period of time to limit the timestamp rate. Timestamp
> input sample rate?

Uhm, you mean time stamp resolution?

Or discarding events?

-EDOESNOTPARSE;


Thanks,
Richard
