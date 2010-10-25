From: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Wrapping proprietary nodes
Date: Mon, 25 Oct 2010 11:32:46 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA306911999@az33exm25.fsl.freescale.net>
References: <20101022214454.GB24896@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <20101022214454.GB24896-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Device-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2BxUpJ8fqYuDpWQv+KbWgnA@public.gmane.org, Tree-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2BxUpJ8fqYuDpWQv+KbWgnA@public.gmane.org, Mailing-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2BxUpJ8fqYuDpWQv+KbWgnA@public.gmane.org
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: devicetree-discuss-
> bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
[mailto:devicetree-
> discuss-bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf
Of
> David VomLehn
> Sent: Friday, October 22, 2010 4:45 PM
> To: Device-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org; Tree-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org;
> Mailing-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org; List-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org;
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Wrapping proprietary nodes
> 
> I expect my device tree will have some proprietary, one-off devices in
it.
> Is it better to wrap these all up in one node:
> 
> 	cisco {
> 		device1 {
> 			...
> 		};
> 		device2 {
> 			...
> 		};
> 	};
> 
> Or should they be specified one node at a time:
> 
> 	cisco-device1 {
> 		...
> 	};
> 	cisco-device2 {
> 		...
> 	};
> 
> My inclination is for the former, but I'd prefer to follow existing
usage,
> if any.

(David, long time no see...:)

The device tree should represent your hardware as it is.  If these
devices sit on some bus, then you should probably represent the
bus, with the devices as subnodes.   Don't create logical container
nodes unless they are warranted for some good reason.

Stuart
