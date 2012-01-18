From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 2/2] Kbuild: Use dtc's -d (dependency) option
Date: Wed, 18 Jan 2012 11:07:58 +0100
Message-ID: <4F1699FE.5050005@suse.cz>
References: <1326134295-15547-1-git-send-email-swarren@nvidia.com>
	<1326134295-15547-2-git-send-email-swarren@nvidia.com>
	<1326310587.2535.291.camel@deneb.redhat.com>
	<4F1206F1.5090405@suse.cz>
	<74CDBE0F657A3D45AFBB94109FB122FF17801D2255@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17801D2255@HQMAIL01.nvidia.com>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Stephen Warren <swarren@nvidia.com>
Cc: Jon Loeliger <jdl@jdl.com>, Russell King <linux@arm.linux.org.uk>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, Arnd Bergmann <arnd@arndb.de>, Aurelien Jacquiot <a-jacquiot@ti.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "microblaze-uclinux@itee.uq.edu.au" <microblaze-uclinux@itee.uq.edu.au>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Paul Mackerras <paulus@samba.org>, Mark Salter <msalter@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux@openrisc.net" <linux@openrisc.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, David
List-Id: devicetree@vger.kernel.org

On 17.1.2012 18:20, Stephen Warren wrote:
> Michal Marek wrote at Saturday, January 14, 2012 3:51 PM:
>> As the C6X port has been merged in this merge window, I can't easily
>> apply this patch to my kbuild branch and at the same time please Linus
>> by basing the pull request on a tagged release. So I'm going to drop the
>> arch/c6x part to keep the kbuild branch "pretty" and let either Mark or
>> Stephen send the patch to Linus directly, once he has merged the kbuild
>> branch. Would that work?
> 
> I was assuming my patches were for 3.4 rather than 3.3, since it's pretty
> late for new features in 3.3. In that case, there wouldn't be an issue,
> right?

OK, that was a misunderstanding then. I applied it to the kbuild branch
for 3.3 and Linus pulled it in the meantime. It's not a terribly
intrusive change, after all.

Michal
