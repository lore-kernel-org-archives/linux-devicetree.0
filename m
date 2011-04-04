From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linus being annoyed by the ARM kernel code
Date: Mon, 4 Apr 2011 07:29:53 -0400
Message-ID: <BANLkTiku0xqBrpPdHe6hn4B94aRPq6-a5A@mail.gmail.com>
References: <AANLkTike+x521179=qQjkt15hs4gH2L2vX1XSFhjM7OW@mail.gmail.com>
	<-7349239223538377619@unknownmsgid>
	<AANLkTimAsNaYZ-fk3d51iwzDwde=kcGGok+R6jK75wRx@mail.gmail.com>
	<alpine.LFD.2.00.1104011756380.28032@xanadu.home>
	<BANLkTimNQD2sWp+vegDKCqP7Y9GCBgkPew@mail.gmail.com>
	<alpine.LFD.2.00.1104021320460.28032@xanadu.home>
	<4D98320C.1090505@linaro.org>
	<BANLkTimu6E44TnSO5S2sJXhDE-B3v8Yz=w@mail.gmail.com>
	<4D989BCE.7020607@linaro.org>
	<alpine.LFD.2.00.1104032134240.28032@xanadu.home>
	<4D99875C.8060004@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D99875C.8060004-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linaro Dev <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Eric Miao <eric.miao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 4, 2011 at 4:54 AM, Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org> wrote:
> Another way to solve it, would be to encode the set of device trees
> supported in a way that removes redundancy. =A0Then the additional data n=
eeded
> to resolve a generic OMAP3 device table into overo or beagle or any simil=
ar
> board would be a small increment. =A0The encoded table can be initdata and
> gotten rid of after being rendered into the DT required.

Grant, this is an interesting idea...

Suppose Linux develops a standardized DT format for describing things
like clock and power domains. This domain data is then acted on by
generic code in the kernel.  The domain data is CPU specific, not
board specific.

It would make sense to me to not put this data into the board specific
device trees. Board specific device trees include the CPU identifier.
During the Linux boot process we could look at the CPU identifier and
then expand the in-memory DT with CPU specific info like the clock and
power domains.

Since each CPU variant would expand into the corresponding nodes we
can now write generic code that acts on this data in a manner that is
not bound to the specific CPU. Keeping data like this out of the board
specific DT makes them easier to write. There's nothing to be gained
by adding dozens of CPU specific nodes to a board level device tree.

-- =

Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
