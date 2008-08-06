From: "Grant Likely" <grant.likely@secretlab.ca>
Subject: Re: [RFC/PATCH 2/3] of: add of_lookup_stdout() utility function
Date: Wed, 6 Aug 2008 07:31:55 -0600
Message-ID: <fa686aa40808060631k278e187ej965f0ac08c837937@mail.gmail.com>
References: <20080806055214.30717.86092.stgit@trillian.secretlab.ca>
	<20080806060239.30717.79273.stgit@trillian.secretlab.ca>
	<20080805.233205.201125898.davem@davemloft.net>
	<18585.31504.836857.829592@cargo.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <18585.31504.836857.829592@cargo.ozlabs.ibm.com>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Paul Mackerras <paulus@samba.org>
Cc: devicetree-discuss@ozlabs.org, miltonm@bga.com, linuxppc-dev@ozlabs.org, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 6, 2008 at 4:21 AM, Paul Mackerras <paulus@samba.org> wrote:
> David Miller writes:
>
>> On sparc platforms this is obtained differently.  We obtain the 32-bit
>> instance value of "/chosen/stdout" and convert that into a prom device
>> node path using "instance-to-path".
>
> That's actually exactly what we do too, the linux,stdout-path property
> is just a cache of the result of that process.  The difference is that
> we have to do it early on while we still have OF around, while you can
> do it later.

It's not what we do with flattened device trees blobs though.  In the
flattened tree we're not using a /chosen/stdout property, just the
linux,stdout-path one.

The question that remains is; should there be?  Should the dt blobs
use /chosen/stdout also?  (I'm not familiar enough with real OF to
know the answer.  I'm assuming that an instance value is not the same
as a phandle).

g.

>
> Paul.
>



-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
