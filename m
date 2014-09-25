From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 00/12] Renesas R-Car DU HDMI support
Date: Thu, 25 Sep 2014 15:09:13 +0200
Message-ID: <1411650553.5671.5.camel@pengutronix.de>
References: <1411589072-28609-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411589072-28609-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

Am Mittwoch, den 24.09.2014, 23:04 +0300 schrieb Laurent Pinchart:
> Hello,
> 
> This patch set adds support for the HDMI output port present on the Renesas
> Koelsch board. Doing so requires two components, a driver for the external
> ADV7511W HDMI encoder, and support for HDMI encoders in the DU driver.
> 
> The HDMI encoder drivers uses the DRM slave encoder framework and the
> component framework to communicate with the DU driver. The DT bindings are
> based on the OF graph bindings to link the display controller and encoder.
> 
> The first two patches have been taken from Philipp Zabel's "[PATCH v3 0/8]
> Add of-graph helpers to loop over endpoints and find ports by id" series.
> Philipp, I don't see that series in linux-next, what's the merge status ?

There is a remaining comment by Guennadi on the soc_camera patch.

regards
Philipp
