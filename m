From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: RFC: New release for DTC?
Date: Thu, 30 May 2013 11:45:23 -0600
Message-ID: <51A79033.7080800@wwwdotorg.org>
References: <201208232015.39613.yann.morin.1998@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201208232015.39613.yann.morin.1998-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "Yann E. MORIN" <yann.morin.1998-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/23/2012 12:15 PM, Yann E. MORIN wrote:
> Hello All!
> 
> Following advice from Jon Loeliger, I would suggest that a new release
> of DTC be tagged and packaged.
> 
> It is important for some projects to rely on a released version, rather
> than use a random cset from the repository. Comes to mind, the automated
> build-systems, such as buildroot.
> 
> Of course, I can help, if need be! ;-)
> 
> Are there any others who think that a release would make sense?

I'd love to see a new release. This would for example allow the U-Boot
project to say "dtc vXXX is required to build the DT files contained in
U-Boot", which might make agreeing on allowing the use of new dtc
features in U-Boot easier. While this could simply be done by referring
to a specific git commit ID, release versions or tags probably carry
more weight. Tagging a release might also act as a specific trigger for
distros to pick up and carry the new version.

Does it make sense to simply tag the current git HEAD as v1.4? If so,
can we do this?
