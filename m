From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 1/6] spmi: Linux driver framework for SPMI
Date: Sat, 15 Feb 2014 11:23:25 -0800
Message-ID: <20140215192325.GB2280@kroah.com>
References: <1391468739-20987-1-git-send-email-joshc@codeaurora.org>
 <1391468739-20987-2-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1391468739-20987-2-git-send-email-joshc@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Sagar Dharia <sdharia@codeaurora.org>, Gilad Avidov <gavidov@codeaurora.org>, Michael Bohan <mbohan@codeaurora.org>, Kenneth Heitke <kheitke@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 03, 2014 at 05:05:33PM -0600, Josh Cartwright wrote:
> From: Kenneth Heitke <kheitke@codeaurora.org>
> 
> System Power Management Interface (SPMI) is a specification
> developed by the MIPI (Mobile Industry Process Interface) Alliance
> optimized for the real time control of Power Management ICs (PMIC).
> 
> SPMI is a two-wire serial interface that supports up to 4 master
> devices and up to 16 logical slaves.
> 
> The framework supports message APIs, multiple busses (1 controller
> per bus) and multiple clients/slave devices per controller.
> 
> Signed-off-by: Kenneth Heitke <kheitke@codeaurora.org>
> Signed-off-by: Michael Bohan <mbohan@codeaurora.org>
> Signed-off-by: Josh Cartwright <joshc@codeaurora.org>

Looks good, nice bus code.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
