From: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH] libfdt: Add support for using aliases in fdt_path_offset()
Date: Thu, 14 Aug 2008 07:02:54 -0500
Message-ID: <5DCA3107-7574-4E1F-9160-B2257BFE3F81@kernel.crashing.org>
References: <Pine.LNX.4.64.0808132251340.29599@blarg.am.freescale.net>
	<20080814041557.GE18344@yookeroo.seuss>
Mime-Version: 1.0 (Apple Message framework v926)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20080814041557.GE18344@yookeroo.seuss>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: David Gibson <david@gibson.dropbear.id.au>
Cc: linuxppc-dev@ozlabs.org, Jon Loeliger <jdl@jdl.com>, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org


On Aug 13, 2008, at 11:15 PM, David Gibson wrote:

> On Wed, Aug 13, 2008 at 10:52:26PM -0500, Kumar Gala wrote:
>> If the path doesn't start with '/' check to see if it matches some  
>> alias
>> under "/aliases" and substitute the matching alias value in the path
>> and retry the lookup.
>
> Kumar, this is broken.  If you match an alias you only follow the path
> one level down from there.  i.e. you will correctly resolve
> 'somealias' and 'somealias/foo', but not 'somealias/foo/bar'.

I'm not clear on what cases you are suggesting fail.

- k
