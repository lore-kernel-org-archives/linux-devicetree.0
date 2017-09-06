From: Rocco Folino <rocco.folino-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] MIPS: ath79: support devicetree selection
Date: Wed, 6 Sep 2017 14:32:00 +0200
Message-ID: <20170906123200.GA21761@void>
References: <b78cb3ef8df8531efdb7b011743ad3f38978015d.1503070362.git.rocco.folino@gmail.com>
 <20170906111435.GA1856@linux-mips.org>
 <20170906142005.67586253@avionic-0141>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170906142005.67586253@avionic-0141>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 06, 2017 at 02:20:05PM +0200, Alban wrote:
> On Wed, 6 Sep 2017 13:14:35 +0200
> Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org> wrote:
> 
> > On Fri, Aug 18, 2017 at 05:32:42PM +0200, Rocco Folino wrote:
> > 
> > > Allow to choose devicetrees from Kconfig.
> > > 
> > > Signed-off-by: Rocco Folino <rocco.folino-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> I don't really see the point of this patch. Building the dtb doesn't
> take any significant time, so why add this extra complexity?

Because you need to select the SoC type in order to enable some drivers, for
example on the AR9331 to use the serial you need the CONFIG_SERIAL_AR933X
which depends on the CONFIG_SOC_AR933X.

Rocco
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
