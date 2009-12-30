From: John Schmoller <jschmoller-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Subject: Device Tree "Status" Property Question
Date: Wed, 30 Dec 2009 10:58:07 -0600
Message-ID: <1262192287.3811.4.camel@johns>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello all,

I'm currently working with U-Boot to pass POST results to Linux in an
FDT.  To do this, I'm intending to use the "status" property, as
documented in ePAPR 1.0 (I'm using PowerPC).  My question involves the
"fail-sss" property value.  What is the intention of "sss"?  Is it meant
to be 3 digit error code, or a string, or what?  I'd like to append a
failure message to the value if that's appropriate.  Something like
"fail-Widgit X did not respond" or some such thing.  Please let me know
if that's not the intended use of the "fail-sss" value.

Thanks for your time,
John
