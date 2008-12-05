From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: R: usb/eth DTS nodes for custom board based on mpc5200
Date: Fri, 5 Dec 2008 08:25:51 -0700
Message-ID: <fa686aa40812050725v7b6d5c8axc5a2aabec18c6e83@mail.gmail.com>
References: <504269.31435.qm@web23108.mail.ird.yahoo.com>
	<fa686aa40812050640m4b4afe2egef638ca950cff041@mail.gmail.com>
	<47602D18F269934AB73B7E550804A1E002137987@FBCMST09V03.fbc.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <47602D18F269934AB73B7E550804A1E002137987-irmLqLvCarwRdKFfnreRio2P0GrZ+RbP@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: gianfranco.casanova-1Ph4/jfBtgs@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 5, 2008 at 8:16 AM,  <gianfranco.casanova-1Ph4/jfBtgs@public.gmane.org> wrote:
> Hi Grant
>
> we have already tested what you are suggesting, but nothing happens.
>
> I'm supposing the problem comes from interrupts.

Unlikely.  The interrupt routing is hard wired into the SoC and
probably not messed up (unless the USB node in the device tree has
been changed).  You may have a problem with port_config (setup for
single ended vs differential signaling) or some other electrical
difference from the 5200.  Beyond that it's not something that is easy
to figure out over email.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
