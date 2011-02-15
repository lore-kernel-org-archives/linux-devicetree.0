From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH] of: Add missing of_address.h to xilinx ehci driver
Date: Wed, 16 Feb 2011 06:58:26 +1000
Message-ID: <AANLkTi=j4COunaLvadkD8Oh2qGaBCsNb8DvrKt_C4GHf@mail.gmail.com>
References: <1297680009-4054-1-git-send-email-monstr@monstr.eu>
	<20110215204011.GB24022@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6163199633611596739=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110215204011.GB24022-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============6163199633611596739==
Content-Type: multipart/alternative; boundary=001485f44a30fa6b5d049c586c7b

--001485f44a30fa6b5d049c586c7b
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 16, 2011 at 6:40 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>wrote:

> On Mon, Feb 14, 2011 at 11:40:09AM +0100, Michal Simek wrote:
> > Build log:
> > In file included from drivers/usb/host/ehci-hcd.c:1208:
> > drivers/usb/host/ehci-xilinx-of.c: In function
> 'ehci_hcd_xilinx_of_probe':
> > drivers/usb/host/ehci-xilinx-of.c:168: error: implicit declaration of
> function 'of_address_to_resource'
> >
> > Signed-off-by: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
> > Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
>
> Applied, thanks.
>

FYI I haven't tried building it, but I believe that ehci-ppc-of.c will need
the same patch.

John

--001485f44a30fa6b5d049c586c7b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Feb 16, 2011 at 6:40 AM, Grant L=
ikely <span dir=3D"ltr">&lt;<a href=3D"mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">gr=
ant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex;">
<div class=3D"im">On Mon, Feb 14, 2011 at 11:40:09AM +0100, Michal Simek wr=
ote:<br>
&gt; Build log:<br>
&gt; In file included from drivers/usb/host/ehci-hcd.c:1208:<br>
&gt; drivers/usb/host/ehci-xilinx-of.c: In function &#39;ehci_hcd_xilinx_of=
_probe&#39;:<br>
&gt; drivers/usb/host/ehci-xilinx-of.c:168: error: implicit declaration of =
function &#39;of_address_to_resource&#39;<br>
&gt;<br>
&gt; Signed-off-by: John Williams &lt;<a href=3D"mailto:john.williams@petal=
ogix.com">john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org</a>&gt;<br>
&gt; Signed-off-by: Michal Simek &lt;<a href=3D"mailto:monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org">mo=
nstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org</a>&gt;<br>
<br>
</div>Applied, thanks.<br></blockquote><div><br></div><div>FYI I haven&#39;=
t tried building it, but I believe that ehci-ppc-of.c will need the same pa=
tch.</div><div></div></div><br>
<div>John</div><div><br></div>

--001485f44a30fa6b5d049c586c7b--

--===============6163199633611596739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6163199633611596739==--
