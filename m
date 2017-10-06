From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt: bindings: media: Document practices for DT
 bindings, ports, endpoints
Date: Fri, 6 Oct 2017 12:29:33 -0500
Message-ID: <20171006172933.gmfs4afw55kdiuit@rob-hp-laptop>
References: <1506673421-6085-1-git-send-email-sakari.ailus@linux.intel.com>
 <1506673421-6085-2-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1506673421-6085-2-git-send-email-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 29, 2017 at 11:23:40AM +0300, Sakari Ailus wrote:
> Port and endpoint numbering has been omitted in DT binding documentation
> for a large number of devices. Also common properties the device uses have
> been missed in binding documentation. Make it explicit that these things
> need to be documented.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
