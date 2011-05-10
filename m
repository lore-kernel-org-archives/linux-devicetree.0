From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Multiple ic2 muxes in a device tree
Date: Tue, 10 May 2011 23:31:54 +0200
Message-ID: <BANLkTikvh72gvcfvF8j0FdBMHZKgP4C+ew@mail.gmail.com>
References: <1B936DB9F22546409EE7E2F50AE76BEE02031931@dragon.enablence.com>
	<4DC9A785.1040209@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4DC9A785.1040209-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 10, 2011 at 11:00 PM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
> I don't know much about how Linux handles i2c hierarchies, but I can spea=
k with some authority about how it the device tree "should" be structured i=
n order to conform to the principles already established for other buses.
>
> Note that *each* pca9547 results in a subtree of the form:
[...]
> I understand the temptation to collapse the hierarchy by combining the mu=
x node with its subordinate buses (using 2 address cells), but in my experi=
ence, shortcuts like that have not aged well.

... and we should defer to your wisdom in this regard.  :-)

> =A0The case where a single-level hierarchy would work would be a simple i=
2c-to-i2c bridge with only one child bus. =A0In this case, the existence of=
 multiple independent child buses argues for the two-level hierarchy, satis=
fying the following requirements:
>
> a) From the standpoint of a parent bus "looking down" at a pca9547, the p=
ca9547 appears to be a single device at a well-defined address.
>
> b) From the standpoint of a child device "looking up" at a pca9547, that =
child is attached to a specific I2C bus with a standard one-cell I2C addres=
s space.
>
> Again, though, I'm unsure that this "correct" hierarchy is compatible wit=
h the expectations of Linux drivers.

Since Linux doesn't do any of this yet; I think we can make sure Linux
implements something sane.

g.
