From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Kernel Documentation MPC52xx Device Tree Bindings
Date: Tue, 20 Jan 2009 09:00:26 -0700
Message-ID: <fa686aa40901200800j51ee6799i888951889d6901d2__14358.529324136$1232468162$gmane$org@mail.gmail.com>
References: <200901200844.40924.roman.fietze@telemotive.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <200901200844.40924.roman.fietze-rVvtEhYSWBkAey3BTtE3dg@public.gmane.org>
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
To: Roman Fietze <roman.fietze-rVvtEhYSWBkAey3BTtE3dg@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 20, 2009 at 12:44 AM, Roman Fietze
<roman.fietze-rVvtEhYSWBkAey3BTtE3dg@public.gmane.org> wrote:
> Hello Grant,
>
> Sorry for mailing to you directly, but joining the appropriate mailing
> lists just for posting this one thing doesn't make too much sense.

You don't need to subscribe to post to the list.  Just email the list
and CC: me.  When I reply it will go to both you *and* the list.

>
> In
>
>  Documentation/powerpc/mpc52xx-device-tree-bindings.txt
>
> you wrote or at least submitted:
>
>  For example, PSC5 might be physically connected to the port labeled
>  'COM1' and PSC1 wired to 'COM1'.  In this case, PSC5 would have a
>  "port-number = <0>" property, and PSC1 would have "port-number =
>  <1>".
>
>
> Shouldn't this read 'COM0' instead of 'COM1' for PSC5?

Yes, you are right, but this description is wrong on another level
too.  I need to rewrite it.  Don't depend on the port-number property
sticking around forever.  It was an ignorant hack and a better way of
choosing human friendly labels to devices is to add properties to the
'aliases' node.  Something like this:

aliases {
        serial0 = &PSC5;
        serial1 = &PSC0;
};

where PSC5 and PSC0 are labels (used by the dtc compiler) on the psc5
and psc0 nodes.  You can see lots of examples of this in
arch/powerpc/boot/dts/

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
