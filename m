From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v4 01/13] dt-bindings: connector: add properties for typec
Date: Mon, 30 Apr 2018 14:23:54 +0300
Message-ID: <20180430112354.GA12870@kuha.fi.intel.com>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
 <1522253178-32414-2-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1522253178-32414-2-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Li Jun <jun.li@nxp.com>
Cc: devel@driverdev.osuosl.org, peter.chen@nxp.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, a.hajda@samsung.com, robh+dt@kernel.org, linux-imx@nxp.com, linux@roeck-us.net, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Mar 29, 2018 at 12:06:06AM +0800, Li Jun wrote:
> +Optional properties for usb-c-connector:
> +- power-type: should be one of "source", "sink" or "dual"(DRP) if typec
> +  connector has power support.
> +- try-power-role: preferred power role if "dual"(DRP) can support Try.SNK
> +  or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
> +- data-type: should be one of "host", "device", "dual"(DRD) if typec
> +  connector supports USB data.

Please use "power-role" and "data-role".


Thanks,

-- 
heikki
