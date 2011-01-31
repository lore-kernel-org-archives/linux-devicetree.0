From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] dt: add of_platform_bus_snoop() which attaches nodes to
	devices
Date: Mon, 31 Jan 2011 15:07:49 -0700
Message-ID: <AANLkTimpjCtaksHCURsZX9JDLd+1+ivPN7Zeq9A4RxMs@mail.gmail.com>
References: <20110131215935.26336.32719.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110131215935.26336.32719.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 31, 2011 at 3:01 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> This patch implements an alternate method for using device tree data
> for populating machine device registration. =A0Traditionally, board
> support has directly generated and registered devices based on nodes
> in the device tree. =A0The board support code starts at the root of the
> tree and begins allocating devices for each device node it finds.
> Similarly, bus drivers (i2c, spi, etc.) use their child nodes to
> register child devices. =A0This model can be seen in almost all the power=
pc
> board ports (arch/powerpc/platforms/*).
>
> However, for many of the ARM SoCs, there already exists complete board
> support for many SoCs that have their own code for registering the
> basic set of platform devices with non-trivial dependencies on clock
> structure and machine specific platform code. =A0While starting at the
> base of the tree and working up is certainly possible, it requires
> modifying a lot of machine support code to get it working.
>
> Instead, this patch provides an alternate approach. =A0Instead of
> starting at the root of the tree and working up, this patch allows the
> SoC support code to register its standard set of platform devices in
> the normal way. =A0However, it also registers a platform_bus notifier
> function which compares platform_device registrations with data in the
> device tree. =A0Whenever it finds a matching node, it increments the
> node reference count and assigns it to the device's of_node pointer so
> that it is available for the device driver to use and bind against.
> For example, an spi master driver would have access to the spi node
> which contains information about all the spi slaves on the bus.

One more note.  It might also be a good idea to do something like this
for the PCI and AMBA buses.  I've not yet looked at how much code
could be made common for implementing that.

g.
