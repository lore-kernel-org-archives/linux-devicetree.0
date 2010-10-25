From: "Segher Boessenkool" <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: RE: Wrapping proprietary nodes
Date: Mon, 25 Oct 2010 21:15:00 +0200 (CEST)
Message-ID: <60550.84.105.60.153.1288034100.squirrel@gate.crashing.org>
References: <20101022214454.GB24896@dvomlehn-lnx2.corp.sa.net>
	<9696D7A991D0824DBA8DFAC74A9C5FA306911999@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9696D7A991D0824DBA8DFAC74A9C5FA306911999-ofAVchDyotYzzZk0BCvKg5jmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: list-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2BxUpJ8fqYuDpWQv+KbWgnA@public.gmane.org, device-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2BxUpJ8fqYuDpWQv+KbWgnA@public.gmane.org, mailing-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2BxUpJ8fqYuDpWQv+KbWgnA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, tree-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2BxUpJ8fqYuDpWQv+KbWgnA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> The device tree should represent your hardware as it is.  If these
> devices sit on some bus, then you should probably represent the
> bus, with the devices as subnodes.   Don't create logical container
> nodes unless they are warranted for some good reason.

More importantly: no device tree client should ever require such
container nodes; but also every client should allow it!

No binding should require it, unless there is something really
special of course.  If you think you have such a special case:
think again.


Segher
