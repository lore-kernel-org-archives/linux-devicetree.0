From: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: Point-to-point bus in device tree
Date: Thu, 5 Apr 2012 13:08:29 -0700
Message-ID: <20120405200829.GA29747@codeaurora.org>
References: <20120405181509.GA28693@codeaurora.org>
 <4F7DF142.5050601@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F7DF142.5050601-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 05, 2012 at 01:23:46PM -0600, Stephen Warren wrote:
> On 04/05/2012 12:15 PM, David Brown wrote:
> > Some MSM SoCs have a small serial-type "bus" that is used to
> > communicate with the PMIC devices.  This interface is always
> > point-to-point.  I'm doing a device-tree conversion of the driver that
> > Ken Heitke posted last year <https://lkml.org/lkml/2011/2/17/503>.
> > 
> > A naive conversion to device tree, would result in something like
> > this:
> > 
> > 	qcom,ssbi@500000 {
> > 		compatible = "qcom,ssbi";
> > 		reg = <0x500000 0x1000>;
> > 		qcom,controller-type = "ssbi";
> > 
> > 		qcom,pmic8058@0 {
> > 			reg = <0x0 0x01>;
> > 			...
> > 		}
> > 	}
> > 
> > There would end up being an extraneous register for the device on the
> > other end (there are no addresses), and there would need to be code in
> > the ssbi driver to traverse this small tree to find these nodes.
> 
> Isn't that extra code simply:
> 
> of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> 
> That seems like pretty low overhead.

True, but it still bothers me to have to have a bogus register.

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
