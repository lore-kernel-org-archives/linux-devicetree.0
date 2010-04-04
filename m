From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Allow dtc to decompile device tre blobs in hexdump format
Date: Sun, 4 Apr 2010 00:30:15 -0600
Message-ID: <y2vfa686aa41004032330xa771e6d5tdc8550fb9d451433@mail.gmail.com>
References: <20100404042232.GN8865@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100404042232.GN8865@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 3, 2010 at 10:22 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> When debugging handoffs between different boot stages which use
> flattened device trees to communicate, it's often useful to dump the
> device tree blob being passed and use dtc to decompile it to something
> readable. =A0However, with some debugging tools it's possible to perform
> a hex memory dump of the device tree, but it's awkward or impossible
> to directly dump the memory as a binary blob.
>
> Obviously, it's quite straightforward to write a script or program to
> convert the hex dump back to binary, but I'm not aware of a standard
> tool to do so.
>
> This patch, therefore, adds a "hex" input format to dtc which allows
> it to directly (or almost so) parse and decompile a device tree blob
> supplied as a hex dump. =A0The input dtc expects in this mode must have
> no addresses or other extraneous text which could contain valid hex
> digits, however it will silently ignore any whitespace, punctuation,
> or other non-hex-digit formatting in the dump. =A0The dump must also
> either be either byte-by-byte, or display each hex number as
> big-endian (so "od -t x1" will produce suitable output on any system,
> but "od -t x2" will produce suitable output only when run on a
> big-endian system).
>
> Thus, if addresses and any header/footer are removed (usually easy to
> do in an editor), dtc will accept quite a wide range of likely hex
> dump formats.

Does it really make sense to build marshaling tools into dtc itself?
I think it would make more sense to keep transformation tools
independent.  ie. what if I have srecord format?  or intel hex?  A
trivial python or perl script would do the job for raw hex.  The
ascii2binary tool should also work.  Also, objcopy handles
srecord/ihex conversion beautifully.

I don't think it makes sense to be teaching dtc different
representations of the same dtb format.

g.
