From: Peter Korsgaard <jacmet-OfajU3CKLf1/SzgSGea1oA@public.gmane.org>
Subject: Re: Device tree for c67x00
Date: Mon, 06 Oct 2008 09:22:58 +0200
Message-ID: <87r66u6vcd.fsf@macbook.be.48ers.dk>
References: <20080926230904.3E572C60081@mail63-dub.bigfish.com>
	<20081005055800.GA14172@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20081005055800.GA14172-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> (Grant Likely's message of
	"Sat\, 4 Oct 2008 23\:58\:01 -0600")
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, git-dev <git-dev-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Jim Hwang <jhwang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Walter Tomkoski <waltert-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

>>>>> "Grant" == Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> writes:

Hi,

 >>     usb@85000000 {
 >>                  compatible = "cypress,c67x00";
 >>                  reg = < 0x85000000 0x10000 >;
 >>                  } ;

This is the first I see of this, but that weren't we supposed to use
the stock ticker (E.G. cy)? It would also be good to list the exact
cy67x00 variant:

usb@85000000 {
             compatible = "cy,c67300" "cy,c67x00";
             ...

-- 
Bye, Peter Korsgaard
