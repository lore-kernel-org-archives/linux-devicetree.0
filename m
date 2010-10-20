From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: dts and dtsi files on which I tested the syntax for my recent
	patch set.
Date: Wed, 20 Oct 2010 17:46:38 -0600
Message-ID: <20101020234638.GB10250@angua.secretlab.ca>
References: <1287613337.4535.1508.camel@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1287613337.4535.1508.camel@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 20, 2010 at 03:22:17PM -0700, John Bonesio wrote:
> Hi,
> 
> I have attached the two file I've used to test the new syntax from my
> patch set. These might help get a feel for how the syntax and the
> features work.

heh, what you should actually do (because you have to anyway) is add
testcases for the new features to dtc in the tests directory.  'make
check' runs the test cases.

> /remove-node/ &{soc/serial@2400};                  /* an example of using a label rooted path */

As previously mentioned by David, this conflicts with the already
established convention of a path that does not start with a '/' means
use a value from the /aliases node.  That ambiguity needs to
be avoided, so the syntax still needs some massaging.

g.
