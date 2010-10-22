From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Wrapping proprietary nodes
Date: Fri, 22 Oct 2010 14:44:54 -0700
Message-ID: <20101022214454.GB24896@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Device-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org, Tree-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org, Mailing-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org, List-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

I expect my device tree will have some proprietary, one-off devices in
it. Is it better to wrap these all up in one node:

	cisco {
		device1 {
			...
		};
		device2 {
			...
		};
	};

Or should they be specified one node at a time:

	cisco-device1 {
		...
	};
	cisco-device2 {
		...
	};

My inclination is for the former, but I'd prefer to follow existing usage,
if any.
-- 
David VL
