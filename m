From: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: Login prompt on a video console instead of serial port?
Date: Mon, 2 May 2011 19:55:21 +0000
Message-ID: <BANLkTikWMksVsvs8KzjdiZfRR-2WGD0Ftw@mail.gmail.com>
References: <4DBF065C.3030407@freescale.com>
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4DBF065C.3030407@freescale.com>
Content-Language: en-US
Content-ID: <2EE6EB65EBBC31478A1DC96F6169254A@freescale.net>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Tabi Timur-B04825 <B04825@freescale.com>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, devicetree-discuss <devicetree-discuss@ozlabs.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Don't you have to spawn a terminal on the framebuffer for the login?
Right now getty spawns the login on the serial port via /etc/inittab.
Something similiar is probably needed for the framebuffer.

-M



On Mon, May 2, 2011 at 2:30 PM, Timur Tabi <timur@freescale.com> wrote:
> I'm using a Freescale P1022DS (PowerPC e500 core) system, which has a bui=
lt-in
> video controller. =A0I have a framebuffer driver that works fine, and if =
I add
> "video=3Dfslfb:1280x1024-32@60,monitor=3D0 console=3Dtty0" to the command=
-line, then
> *most* of the kernel boot log appears on the serial port and the video di=
splay.
>
> However, the login prompt is always on the serial port. =A0This happens e=
ven if I
> delete the "console=3DttyS0,115200" from the command-line. =A0I presume t=
his is
> because the "linux,stdout-path" property in the device tree always points=
 to a
> serial port node.
>
> So my question is: what do I need to do get the login prompt on the video
> console? =A0That is, stdout goes to /dev/fb0 but stdin is still from /dev=
/ttyS0.
> I presume I need to direct "linux,stdout-path" to the fslfb node in the d=
evice
> tree, but there doesn't appear to be support for "linux,stdin-path".
