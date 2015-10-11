From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 1/5] mtd: mtdpart: add debug prints to partition
 parser.
Date: Sun, 11 Oct 2015 13:00:39 -0700
Message-ID: <20151011200010.GA3696@localhost>
References: <cover.1439911625.git.hramrach@gmail.com>
 <5b636f504e32c9fe83df22694656075f4f45c710.1439911625.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5b636f504e32c9fe83df22694656075f4f45c710.1439911625.git.hramrach@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Suchanek <hramrach@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 18, 2015 at 03:34:07PM -0000, Michal Suchanek wrote:
> The probe of a mtd device can fail when a partition parser returns
> error. The failure due to partition parsing can be quite mysterious when
> multiple partitioning schemes are comiled in and any of them can fail
> the probe.
> 
> Add debug prints which show what parsers were tried and what they
> returned.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
> v2:
> 
>  - reformat debug messages

Looks OK to me. Applied to l2-mtd.git.
