From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/7] drivers/macintosh/via-pmu-led.c: Add of_node_put
	to avoid memory leak
Date: Tue, 31 Aug 2010 10:13:26 -0600
Message-ID: <20100831161326.GA6347@angua.secretlab.ca>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
	<1283075566-27441-2-git-send-email-julia@diku.dk>
	<4C7D247F.4060500@bfs.de>
	<Pine.LNX.4.64.1008311807470.2668@ask.diku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1008311807470.2668-QfmoRoYWmW9knbxzx/v8hQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, walter harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 31, 2010 at 06:08:19PM +0200, Julia Lawall wrote:
> On Tue, 31 Aug 2010, walter harms wrote:
> > > @@ -92,8 +92,10 @@ static int __init via_pmu_led_init(void)
> > >  	if (dt == NULL)
> > >  		return -ENODEV;
> > >  	model = of_get_property(dt, "model", NULL);
> > > -	if (model == NULL)
> > > +	if (model == NULL) {
> > > +		of_node_put(dt);
> > >  		return -ENODEV;
> > > +	}
> > >  	if (strncmp(model, "PowerBook", strlen("PowerBook")) != 0 &&
> > >  	    strncmp(model, "iBook", strlen("iBook")) != 0 &&
> > >  	    strcmp(model, "PowerMac7,2") != 0 &&
> > > 
> > 
> > is there any rule that says when to use strncmp ? it seems perfecly valid to use strcpy here
> > (what is done in the last cmp).
> 
> Perhaps there are some characters after eg PowerBook that one doesn't want 
> to compare with?

Yes.  The model property on powermacs always has the version number.   strncmp makes sure that *all* PowerBooks and iBooks are matched.

g.
