From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH] Fix compilation warning/error in setprop_inplace.c
Date: Wed, 27 Jun 2012 08:03:08 -0500
Message-ID: <E1Sjrtk-0006Zs-6Q@jdl.com>
References: <1339534092-27377-1-git-send-email-swarren@wwwdotorg.org>
 <20120613023152.GJ6614@truffala.fritz.box>
 <20120625025648.GB24695@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20120625025648.GB24695-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On Wed, Jun 13, 2012 at 12:31:52PM +1000, David Gibson wrote:
> > On Tue, Jun 12, 2012 at 02:48:12PM -0600, Stephen Warren wrote:
> > > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > When compiling the current code-base with gcc 4.6.1, the following wa=
> rning
> > > is raised, which is interpreted as an error:
> > >=20
> > > cc1: warnings being treated as errors
> > > tests/setprop_inplace.c: In function =E2=80=98main=E2=80=99:
> > > tests/setprop_inplace.c:62: error: format =E2=80=98%016llx=E2=80=99 e=
> xpects type =E2=80=98long long unsigned int=E2=80=99, but argument 2 has =
> type =E2=80=98uint64_t=E2=80=99
> > > tests/setprop_inplace.c:68: error: format =E2=80=98%016llx=E2=80=99 e=
> xpects type =E2=80=98long long unsigned int=E2=80=99, but argument 2 has =
> type =E2=80=98uint64_t=E2=80=99
> > >=20
> > > Use printf format specifiers from <inttypes.h> to solve this.
> > >=20
> > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> 
> Jon?
> 
> Please apply...

Applied and pushed out.

Sorry,
jdl
