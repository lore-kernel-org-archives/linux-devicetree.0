From: Nate Case <ncase-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Device tree binding documentation
Date: Tue, 28 Oct 2008 15:54:10 -0500
Message-ID: <1225227250.30047.151.camel@localhost.localdomain>
References: <fa686aa40810272323s4a5c2f50u8aa999952aaa6b2@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA3047E572F@az33exm25.fsl.freescale.net>
	<490744B1.2000602@genesi-usa.com>
	<fa686aa40810281027r64d4f78enfcb1c92c9ac6401e@mail.gmail.com>
	<49076A8C.3010105@genesi-usa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <49076A8C.3010105-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Hugh Blemings <hab-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2008-10-28 at 14:39 -0500, Matt Sealey wrote:
> I guess we would need to decide how those documents are published
> without using proprietary software, then, and easily committed to
> another git repository (or the same one just in a published form).
> I don't suppose office xml is a good choice? It should be flexible
> enough and similar enough that sections and layout do not change a
> great deal, and git can easily produce diffs?

I would suggest using DocBook if publishing PDFs is a goal.  It would
also let you output text and HTML as an added bonus.

-- 
Nate Case <ncase-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
